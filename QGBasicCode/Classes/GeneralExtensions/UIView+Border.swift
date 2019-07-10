//
//  UIView+Border.swift
//  HealthyWater
//
//  Created by felix_rrs on 2018/11/10.
//  Copyright © 2018年 felix_rrs. All rights reserved.
//

import UIKit

public extension UIView {
    
    public class BorderOptions {
        class var top: UInt32 { return 1<<1 }
        class var left: UInt32 { return 1<<2 }
        class var bottom: UInt32 { return 1<<3 }
        class var right: UInt32 { return 1<<4 }
    }
    
    // 画线
    private func drawBorder(rect:CGRect, color:UIColor) {
        
        let line = UIBezierPath(rect: rect)
        let lineShape = CAShapeLayer()
        lineShape.path = line.cgPath
        lineShape.fillColor = color.cgColor
        self.layer.addSublayer(lineShape)
    }
    
    // 设置右边框
    public func rightBorder(width: CGFloat, borderColor: UIColor) {
        let rect = CGRect(x: 0, y: self.frame.size.width - width, width: width, height: self.frame.size.height)
        drawBorder(rect: rect, color: borderColor)
    }
    // 设置左边框
    public func leftBorder(width: CGFloat, borderColor: UIColor) {
        let rect = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
        drawBorder(rect: rect, color: borderColor)
    }
    
    // 设置上边框
    public func topBorder(width:CGFloat, borderColor:UIColor) {
        let rect = CGRect(x: 0, y: 0, width: self.frame.size.width, height: width)
        drawBorder(rect: rect, color: borderColor)
    }
    
    // 设置底边框
    public func buttomBorder(width:CGFloat,borderColor:UIColor) {
        let rect = CGRect(x: 0, y: self.frame.size.height-width, width: self.frame.size.width, height: width)
        drawBorder(rect: rect, color: borderColor)
    }
}
