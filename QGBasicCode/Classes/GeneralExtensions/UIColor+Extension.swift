//
//  UIColor+Extension.swift
//  QGTabViewDemo
//
//  Created by felix_rrs on 2018/5/25.
//  Copyright © 2018年 rrs. All rights reserved.
//

import UIKit

// MARK:- UIColor.Ext
public extension UIColor {
    
    /** 十六进制数 -> UIColor */
    public convenience init(_ hex: Int32) {
        let r = CGFloat(((hex & 0x00FF0000) >> 16)) / 255.0
        let g = CGFloat(((hex & 0x0000FF00) >> 8)) / 255.0
        let b = CGFloat(hex & 0x000000FF) / 255.0
        
        self.init(red: r, green: g, blue: b, alpha: 1.0)
    }
    
    
    /** RGBA -> UIColor */
    public convenience init(r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat=1.0) {
        self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    }
    
    
    /** 随机颜色 */
    public class func randomColor() -> UIColor {
        return UIColor(r: CGFloat(arc4random_uniform(256)), g: CGFloat(arc4random_uniform(256)), b: CGFloat(arc4random_uniform(256)))
    }
    
    /** 获取颜色的RGB值 */
    public func getRGBValue() -> (CGFloat, CGFloat, CGFloat) {
        guard var comp = cgColor.components else {
            fatalError("颜色请按照RGB方式设置")
        }
        if comp.count < 3 {
            return comp[0] == 0 ? (0, 0, 0) :(255, 255, 255)
        }
        return (comp[0] * 255, comp[1] * 255, comp[2] * 255)
    }
    
    /** 获取两个颜色RGB的差值 */
    public class func getRGBDelta(_ color1: UIColor, _ color2: UIColor) ->(CGFloat, CGFloat, CGFloat) {
        let RGB1 = color1.getRGBValue()
        let RGB2 = color2.getRGBValue()
        return (RGB1.0-RGB2.0, RGB1.1-RGB2.1, RGB1.2-RGB2.2)
    }
    
    /** 根据颜色生成图片 */
    public class func generateImg(_ color: UIColor) -> UIImage? {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img
    }
}





// MARK:- Color Const

public let kGray3 = UIColor(0x333333)
public let kGray6 = UIColor(0x666666)
public let kGray9 = UIColor(0x999999)
public let kGrayA6 = UIColor(0xA6A6A6)
public let kGrayBD = UIColor(0xBDBDBD)
public let kGrayCC = UIColor(0xCCCCCC)
public let kGrayDC = UIColor(0xDCDCDC)
public let kGrayEF = UIColor(0xEFEFEF)
public let kGrayF2 = UIColor(0xF2F2F2)
public let kGrayF5 = UIColor(0xF5F5F5)
public let kGrayFA = UIColor(0xFAFAFA)
public let kBlack = UIColor.black
public let kWhite = UIColor.white
public let kRed = UIColor.red
public let kGreen = UIColor.green
public let kBlue = UIColor.blue
public let kClear = UIColor.clear
public let kRandomColor = UIColor.randomColor()

public let kRed_SBState = UIColor(0xFF7145)
public let kGreen_SBState = UIColor(0x1CC367)
public let kBlue_hw =  UIColor(0x2283E2)
