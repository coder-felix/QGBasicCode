//
//  UIScrollView+HeaderImg.m
//  HealthyWater
//
//  Created by felix_rrs on 2017/11/5.
//  Copyright © 2017年 felix_rrs. All rights reserved.
//

#import "UIScrollView+HeaderImg.h"
#import <objc/runtime.h>

#define RRSKeyPath(objc, keyPath) @(((void)objc.keyPath, #keyPath))


@interface NSObject (MethodSwizzling)

+ (void)rrs_swizzleInstanceSelector:(SEL)origSelector swizzleSelector:(SEL)swizzleSelector;

+ (void)rrs_swizzleClassSelector:(SEL)origSelector swizzleSelector:(SEL)swizzleSelector;

@end

@implementation NSObject (MethodSwizzling)

+ (void)rrs_swizzleInstanceSelector:(SEL)origSelector swizzleSelector:(SEL)swizzleSelector {
    
    Method origMethod = class_getInstanceMethod(self, origSelector);
    Method swizzleMethod = class_getInstanceMethod(self, swizzleSelector);
    BOOL isAdd = class_addMethod(self, origSelector, method_getImplementation(swizzleMethod), method_getTypeEncoding(swizzleMethod));
    
    if (!isAdd) {
        method_exchangeImplementations(origMethod, swizzleMethod);
    }else {
        class_replaceMethod(self, swizzleSelector, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    }
}

+ (void)rrs_swizzleClassSelector:(SEL)origSelector swizzleSelector:(SEL)swizzleSelector {
    Method origMethod = class_getClassMethod(self, origSelector);
    Method swizzleMethod = class_getClassMethod(self, swizzleSelector);
    
    BOOL isAdd = class_addMethod(self, origSelector, method_getImplementation(swizzleMethod), method_getTypeEncoding(swizzleMethod));
    
    if (!isAdd) {
        method_exchangeImplementations(origMethod, swizzleMethod);
    }
}

@end


static char * const headerImageViewKey = "headerImageViewKey";
static char * const headerImageViewHeight = "headerImageViewHeight";
static char * const isInitialKey = "isInitialKey";

// 默认图片高度
static CGFloat const oriImageH = 200;


@implementation UIScrollView (HeaderImg)

+ (void)load {
    [self rrs_swizzleInstanceSelector:@selector(setTableHeaderView:) swizzleSelector:@selector(setRrs_TableHeaderView:)];
}

- (void)setRrs_TableHeaderView:(UIView *)tableHeaderView {
    
    if (![self isMemberOfClass:[UITableView class]]) return;
    
    [self setRrs_TableHeaderView:tableHeaderView];
    
    UITableView *tableView = (UITableView *)self;
    
    self.rrs_headerScaleImageHeight = tableView.tableHeaderView.frame.size.height;
}

// 懒加载头部imageView
- (UIImageView *)rrs_headerImageView {
    UIImageView *imageView = objc_getAssociatedObject(self, headerImageViewKey);
    if (imageView == nil) {
        
        imageView = [[UIImageView alloc] init];
        
        imageView.clipsToBounds = YES;
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        
        [self insertSubview:imageView atIndex:0];
        
        objc_setAssociatedObject(self, headerImageViewKey, imageView,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return imageView;
}

// 属性：rrs_isInitial
- (BOOL)rrs_isInitial {
    return [objc_getAssociatedObject(self, isInitialKey) boolValue];
}

- (void)setRrs_isInitial:(BOOL)rrs_isInitial {
    objc_setAssociatedObject(self, isInitialKey, @(rrs_isInitial),OBJC_ASSOCIATION_ASSIGN);
}

// 属性： rrs_headerImageViewHeight
- (void)setRrs_headerScaleImageHeight:(CGFloat)rrs_headerScaleImageHeight {
    objc_setAssociatedObject(self, headerImageViewHeight, @(rrs_headerScaleImageHeight),OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self setupHeaderImageViewFrame];
}

- (CGFloat)rrs_headerScaleImageHeight {
    CGFloat headerImageHeight = [objc_getAssociatedObject(self, headerImageViewHeight) floatValue];
    return headerImageHeight == 0?oriImageH:headerImageHeight;
}

// 属性：rrs_headerImage
- (UIImage *)rrs_headerScaleImage {
    return self.rrs_headerImageView.image;
}

// 设置头部imageView的图片
- (void)setRrs_headerScaleImage:(UIImage *)rrs_headerScaleImage {
    self.rrs_headerImageView.image = rrs_headerScaleImage;
    
    [self setupHeaderImageView];
}

// 设置头部视图的位置
- (void)setupHeaderImageViewFrame {
    self.rrs_headerImageView.frame = CGRectMake(0 , 0, self.bounds.size.width , self.rrs_headerScaleImageHeight);
    
}

// 初始化头部视图
- (void)setupHeaderImageView {
    [self setupHeaderImageViewFrame];
    
    if (self.rrs_isInitial == NO) {
        [self addObserver:self forKeyPath:RRSKeyPath(self, contentOffset) options:NSKeyValueObservingOptionNew context:nil];
        self.rrs_isInitial = YES;
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    CGFloat offsetY = self.contentOffset.y;
    if (offsetY < 0) {
        self.rrs_headerImageView.frame = CGRectMake(offsetY, offsetY, self.bounds.size.width - offsetY * 2, self.rrs_headerScaleImageHeight - offsetY);
    }else {
        self.rrs_headerImageView.frame = CGRectMake(0, 0, self.bounds.size.width, self.rrs_headerScaleImageHeight);
    }
}

- (void)dealloc {
    if (self.rrs_isInitial) {
        [self removeObserver:self forKeyPath:RRSKeyPath(self, contentOffset)];
    }
}


@end
