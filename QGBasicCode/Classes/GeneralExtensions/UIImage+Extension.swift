//
//  UIImage+Extension.swift
//  HealthyWater
//
//  Created by felix_rrs on 2018/9/27.
//  Copyright © 2018年 海尔优家智能科技（北京）有限公司. All rights reserved.
//

import UIKit

public extension UIImage {
    /// view -> image
    public convenience init(view: UIView) {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, kScale)
        let ctx = UIGraphicsGetCurrentContext()!
        view.layer.render(in: ctx)
        self.init(cgImage: (UIGraphicsGetImageFromCurrentImageContext()?.cgImage)!, scale: kScale, orientation: UIImage.Orientation.up)
        UIGraphicsEndImageContext()
    }
    
    /// 根据颜色获取纯色图片
    public convenience init(color: UIColor) {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        self.init(cgImage: (UIGraphicsGetImageFromCurrentImageContext()?.cgImage)!, scale: kScale, orientation: UIImage.Orientation.up)
        UIGraphicsEndImageContext()
    }
    
    /// 根据颜色获取渐变色图片 
    public convenience init?(gradientColors: [UIColor], size: CGSize = CGSize(width: 10, height: 10), orientation: UIImage.Orientation = .up) {
        UIGraphicsBeginImageContextWithOptions(size, true, kScale)
        let context = UIGraphicsGetCurrentContext()
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let colors = gradientColors.map{ return $0.cgColor as AnyObject? } as NSArray
        let gradient = CGGradient(colorsSpace: colorSpace, colors: colors, locations: nil)
        context!.drawLinearGradient(gradient!, start: CGPoint(x: 0, y: 0), end: CGPoint(x: size.width, y: 0), options: CGGradientDrawingOptions(rawValue: 0))
        
        self.init(cgImage: (UIGraphicsGetImageFromCurrentImageContext()?.cgImage)!, scale: kScale, orientation: orientation)
        UIGraphicsEndImageContext()
    }
    
    /// 更改图片颜色
    public func render(_ color: UIColor) -> UIImage {
//        UIGraphicsBeginImageContext(self.size)
        let w = self.size.width*kScale
        let h = self.size.height*kScale
        UIGraphicsBeginImageContext(CGSize(width: w, height: h))
        color.setFill()
        let bounds = CGRect.init(x: 0, y: 0, width: w, height: h)
        UIRectFill(bounds)
        self.draw(in: bounds, blendMode: CGBlendMode.destinationIn, alpha: 1.0)
        let tintedImage = UIGraphicsGetImageFromCurrentImageContext()!
        let img = UIImage(cgImage: tintedImage.cgImage!, scale: kScale, orientation: UIImage.Orientation.up)
        
        UIGraphicsEndImageContext()
        return img
    }
    
    
    
    
//    public func circleImg(_ color: UIColor) -> UIImage {
//        let wh: CGFloat = 10.0
//        let size = CGSize(width: wh, height: wh)
//        let rect = CGRect(x: 0, y: 0, width: wh, height: wh)
//        UIGraphicsBeginImageContextWithOptions(size, true, 0.0)
//        guard let ctx = UIGraphicsGetCurrentContext() else { return UIImage() }
////        ctx.addArc(center: CGPoint(x: wh*0.5, y: wh*0.5), radius: wh*0.5, startAngle: 0, endAngle: CGFloat.pi*2, clockwise: false)
////        ctx.addEllipse(in: rect)
//        ctx.setFillColor(color.cgColor)
////        ctx.clip()
////        ctx.clip(to: rect)
//        
//        
////        UIRectFill(rect)
////        let path = UIBezierPath(ovalIn: rect)
////        path.addClip()
////        ctx.addPath(path.cgPath)
////        ctx.clip(to: rect)
////        ctx.strokeEllipse(in: rect)
////        color.setFill()
//        ctx.clear(rect)
//        
//        ctx.fillEllipse(in: rect)
//        
////        ctx.clip()
////        self.draw(in: rect)
//        guard let make = UIGraphicsGetImageFromCurrentImageContext() else { return UIImage() }
//        UIGraphicsEndImageContext()
//        return make
//    }
    
    
    /// 生成圆形图片
    public func toCircle() -> UIImage {
        let shotest = min(self.size.width, self.size.height)
        let outputRect = CGRect(x: 0, y: 0, width: shotest, height: shotest)
        UIGraphicsBeginImageContextWithOptions(outputRect.size, false, 0)
        let context = UIGraphicsGetCurrentContext()!
        context.addEllipse(in: outputRect)
        context.clip()
        self.draw(in: CGRect(x: (shotest-self.size.width)/2,
                             y: (shotest-self.size.height)/2,
                             width: self.size.width,
                             height: self.size.height))
        let maskedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return maskedImage
    }
    
}

public extension CAGradientLayer {
    public static func gradient(colors: [UIColor], locations: [CGFloat], frame: CGRect) -> CAGradientLayer {
        let make = CAGradientLayer()
        make.colors = colors.map{ return $0.cgColor }
        make.locations = locations.map{ return $0 as NSNumber }
        make.startPoint = CGPoint(x: 0, y: 0)
        make.endPoint = CGPoint(x: 1.0, y: 0)
        make.frame = frame
        return make
    }
}
