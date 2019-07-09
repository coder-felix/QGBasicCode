//
//  UIView+Frame.swift
//  QGTabViewDemo
//
//  Created by felix_rrs on 2018/5/25.
//  Copyright © 2018年 rrs. All rights reserved.
//

import UIKit

// MARK:- UIView.Frame.Ext
extension UIView {
//
//    var left: CGFloat {
//        get { return self.frame.origin.x }
//        set(newValue) { self.frame.origin.x = newValue }
//    }
//
//    var right: CGFloat {
//        get { return self.frame.origin.x + self.frame.size.width }
//        set(newValue) { self.frame.origin.x = newValue - self.width }
//    }
//
//    var top: CGFloat {
//        get { return self.frame.origin.y }
//        set(newValue) { self.frame.origin.y = newValue }
//    }
//
//    var bottom: CGFloat {
//        get { return self.frame.origin.y + self.frame.size.height }
//        set(newValue) { self.frame.origin.y = newValue - self.frame.size.height }
//    }
//
//    var width: CGFloat {
//        get { return self.frame.size.width }
//        set(newValue) { self.frame.size.width = newValue }
//    }
//
//    var height: CGFloat {
//        get { return self.frame.size.height }
//        set(newValue) { self.frame.size.height = newValue }
//    }
//
//    var centerX: CGFloat {
//        get { return self.center.x }
//        set(newValue) { self.center.x = newValue }
//    }
//
//    var centerY: CGFloat {
//        get { return self.center.y }
//        set(newValue) { self.center.y = newValue }
//    }
//
//    var origin: CGPoint {
//        get { return self.frame.origin }
//        set(newValue) { self.frame.origin = newValue }
//    }
    
}

// MARK:- SizeFitAccordingTo6s
func W(_ x: CGFloat) -> CGFloat {
    return x * kScreenW / kScreenW_6s
}

func H(_ y: CGFloat) -> CGFloat {
    return y * kScreenH / kScreenH_6s
}

func kFont(_ size: CGFloat, _ bold: Bool = false) -> UIFont {
    if bold {
        return UIFont.boldSystemFont(ofSize: W(size))
    }else {
        return UIFont.systemFont(ofSize: W(size))
    }
}




// MARK:- MODELs
/// iPhone X or Later (是否刘海屏)
let isIPhoneXL: Bool = (kSafeBottom > 0.0)
/// iPhone6 的4.7尺寸
let isIPhoneS47: Bool = (kScreenH == kScreenH_6s)
/// iPhone6p 的5.5尺寸
let isIPhoneS55: Bool = (kScreenH == kScreenH_6p)

// MARK:- Frame Const
/// 缩放比例
let kScale: CGFloat = UIScreen.main.scale
/// 状态栏高度 20 / 44
let kStatusBarH: CGFloat = isIPhoneXL ? 44 : 20
/// 状态栏高度 20 / 44, 若有热点连接则+=20
let kStatusBarH_hp: CGFloat = UIApplication.shared.statusBarFrame.size.height
/// 导航栏高度
let kNaviBarH: CGFloat = kStatusBarH + 44.0
/// 导航栏高度, 考虑可能开启热点的情况
let kNaviBarH_hp: CGFloat = kStatusBarH_hp + 44.0
/// 标签栏高度
let kTabBarH: CGFloat = kSafeBottom + 49.0
/// 顶部安全高度
let kSafeTop: CGFloat = (isIPhoneXL ? kStatusBarH : 0)
/// 底部安全高度
let kSafeBottom: CGFloat = { // 0 34
    if #available(iOS 11.0, *),
        let safeBtm = UIApplication.shared.delegate?.window??.safeAreaInsets.bottom {
        return safeBtm
    }else {
        return 0
    }
}()

//let kScreenW: CGFloat = UIScreen.main.bounds.width
//let kScreenH: CGFloat = UIScreen.main.bounds.height

let kScreenW_4s: CGFloat = 320
let kScreenH_4s: CGFloat = 480

let kScreenW_5s: CGFloat = 320
let kScreenH_5s: CGFloat = 568

let kScreenW_6s: CGFloat = 375
let kScreenH_6s: CGFloat = 667

let kScreenW_6p: CGFloat = 414 // 1242×2208, @3x, 458ppi (1080×1920)
let kScreenH_6p: CGFloat = 736

let kScreenW_X: CGFloat = 375  // 1125×2436, @3x, 458ppi
let kScreenH_X: CGFloat = 812

let kScreenW_XSM: CGFloat = 414 // 1242×2688, @3x, 458ppi
let kScreenH_XSM: CGFloat = 896

let kScreenW_XR: CGFloat = 414 // 828×1792, @2x, 326ppi
let kScreenH_XR: CGFloat = 896

let w1: CGFloat = W(1)
let w2: CGFloat = W(2)
let w5: CGFloat = W(5)
let w10: CGFloat = W(10)
let w15: CGFloat = W(15)
let w20: CGFloat = W(20)
let w25: CGFloat = W(25)
let w30: CGFloat = W(30)









//let isIphoneX: Bool = (kScreenH == kScreenH_X)
//let kStatusBarH: CGFloat = (isIphoneX ? 44 : 20)
//let kNaviBarH: CGFloat = (isIphoneX ? 88 : 64)
//let kTabBarH: CGFloat = (isIphoneX ? 83 : 49)
//let kSafeBtmH: CGFloat = 34

//let isIphoneXLater: Bool = {
//    if #available(iOS 11.0, *),
//        let safeBtm = UIApplication.shared.delegate?.window??.safeAreaInsets.bottom {
//        return safeBtm > CGFloat(0)
//    }else {
//        return false
//    }
//}()
