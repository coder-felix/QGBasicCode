//
//  UIScrollView+HeaderImg.h
//  HealthyWater
//
//  Created by felix_rrs on 2017/11/5.
//  Copyright © 2017年 felix_rrs. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (HeaderImg)
/** 头部缩放视图图片  */
@property (nonatomic, strong) UIImage *rrs_headerScaleImage;

/** 头部缩放视图图片高度  */
@property (nonatomic, assign) CGFloat rrs_headerScaleImageHeight;
@end

NS_ASSUME_NONNULL_END
