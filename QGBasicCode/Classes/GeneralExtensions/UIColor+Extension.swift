//
//  UIColor+Extension.swift
//  QGTabViewDemo
//
//  Created by felix_rrs on 2018/5/25.
//  Copyright © 2018年 rrs. All rights reserved.
//

import UIKit

// MARK:- UIColor.Ext
extension UIColor {
    
    /** 十六进制数 -> UIColor */
    convenience init(_ hex: Int32) {
        let r = CGFloat(((hex & 0x00FF0000) >> 16)) / 255.0
        let g = CGFloat(((hex & 0x0000FF00) >> 8)) / 255.0
        let b = CGFloat(hex & 0x000000FF) / 255.0
        
        self.init(red: r, green: g, blue: b, alpha: 1.0)
    }
    
    
    /** RGBA -> UIColor */
    convenience init(r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat=1.0) {
        self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    }
    
    
    /** 随机颜色 */
    class func randomColor() -> UIColor {
        return UIColor(r: CGFloat(arc4random_uniform(256)), g: CGFloat(arc4random_uniform(256)), b: CGFloat(arc4random_uniform(256)))
    }
    
    /** 获取颜色的RGB值 */
    func getRGBValue() -> (CGFloat, CGFloat, CGFloat) {
        guard var comp = cgColor.components else {
            fatalError("颜色请按照RGB方式设置")
        }
        if comp.count < 3 {
            return comp[0] == 0 ? (0, 0, 0) :(255, 255, 255)
        }
        return (comp[0] * 255, comp[1] * 255, comp[2] * 255)
    }
    
    /** 获取两个颜色RGB的差值 */
    class func getRGBDelta(_ color1: UIColor, _ color2: UIColor) ->(CGFloat, CGFloat, CGFloat) {
        let RGB1 = color1.getRGBValue()
        let RGB2 = color2.getRGBValue()
        return (RGB1.0-RGB2.0, RGB1.1-RGB2.1, RGB1.2-RGB2.2)
    }
    
    /** 根据颜色生成图片 */
    class func generateImg(_ color: UIColor) -> UIImage? {
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

let kGray3 = UIColor(0x333333)
let kGray6 = UIColor(0x666666)
let kGray9 = UIColor(0x999999)
let kGrayA6 = UIColor(0xA6A6A6)
let kGrayBD = UIColor(0xBDBDBD)
let kGrayCC = UIColor(0xCCCCCC)
let kGrayDC = UIColor(0xDCDCDC)
let kGrayEF = UIColor(0xEFEFEF)
let kGrayF2 = UIColor(0xF2F2F2)
let kGrayF5 = UIColor(0xF5F5F5)
let kGrayFA = UIColor(0xFAFAFA)
let kBlack = UIColor.black
let kWhite = UIColor.white
let kRed = UIColor.red
let kGreen = UIColor.green
let kBlue = UIColor.blue
let kClear = UIColor.clear
let kRandomColor = UIColor.randomColor()

let kRed_SBState = UIColor(0xFF7145)
let kGreen_SBState = UIColor(0x1CC367)
let kBlue_hw =  UIColor(0x2283E2)
