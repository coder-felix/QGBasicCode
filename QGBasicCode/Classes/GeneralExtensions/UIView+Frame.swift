//
//  UIView+Frame.swift
//  QGTabViewDemo
//
//  Created by felix_rrs on 2018/5/25.
//  Copyright © 2018年 rrs. All rights reserved.
//

import UIKit

// MARK:- UIView.Frame.Ext
public extension UIView {

    public var left: CGFloat {
        get { return self.frame.origin.x }
        set(newValue) { self.frame.origin.x = newValue }
    }

    public var right: CGFloat {
        get { return self.frame.origin.x + self.frame.size.width }
        set(newValue) { self.frame.origin.x = newValue - self.width }
    }

    public var top: CGFloat {
        get { return self.frame.origin.y }
        set(newValue) { self.frame.origin.y = newValue }
    }

    public var bottom: CGFloat {
        get { return self.frame.origin.y + self.frame.size.height }
        set(newValue) { self.frame.origin.y = newValue - self.frame.size.height }
    }

    public var width: CGFloat {
        get { return self.frame.size.width }
        set(newValue) { self.frame.size.width = newValue }
    }

    public var height: CGFloat {
        get { return self.frame.size.height }
        set(newValue) { self.frame.size.height = newValue }
    }

    public var centerX: CGFloat {
        get { return self.center.x }
        set(newValue) { self.center.x = newValue }
    }

    public var centerY: CGFloat {
        get { return self.center.y }
        set(newValue) { self.center.y = newValue }
    }

    public var origin: CGPoint {
        get { return self.frame.origin }
        set(newValue) { self.frame.origin = newValue }
    }
    
}

// MARK:- SizeFitAccordingTo6s
public func W(_ x: CGFloat) -> CGFloat {
    return x * kScreenW / kScreenW_6s
}

public func H(_ y: CGFloat) -> CGFloat {
    return y * kScreenH / kScreenH_6s
}

public func kFont(_ size: CGFloat, _ bold: Bool = false) -> UIFont {
    if bold {
        return UIFont.boldSystemFont(ofSize: W(size))
    }else {
        return UIFont.systemFont(ofSize: W(size))
    }
}




// MARK:- MODELs
/// iPhone X or Later (是否刘海屏)
public let isIPhoneXL: Bool = (kSafeBottom > 0.0)
/// iPhone6 的4.7尺寸
public let isIPhoneS47: Bool = (kScreenH == kScreenH_6s)
/// iPhone6p 的5.5尺寸
public let isIPhoneS55: Bool = (kScreenH == kScreenH_6p)

// MARK:- Frame Const
/// 缩放比例
public let kScale: CGFloat = UIScreen.main.scale
/// 状态栏高度 20 / 44
public let kStatusBarH: CGFloat = isIPhoneXL ? 44 : 20
/// 状态栏高度 20 / 44, 若有热点连接则+=20
public let kStatusBarH_hp: CGFloat = UIApplication.shared.statusBarFrame.size.height
/// 导航栏高度
public let kNaviBarH: CGFloat = kStatusBarH + 44.0
/// 导航栏高度, 考虑可能开启热点的情况
public let kNaviBarH_hp: CGFloat = kStatusBarH_hp + 44.0
/// 标签栏高度
public let kTabBarH: CGFloat = kSafeBottom + 49.0
/// 顶部安全高度
public let kSafeTop: CGFloat = (isIPhoneXL ? kStatusBarH : 0)
/// 底部安全高度
public let kSafeBottom: CGFloat = { // 0 34
    if #available(iOS 11.0, *),
        let safeBtm = UIApplication.shared.delegate?.window??.safeAreaInsets.bottom {
        return safeBtm
    }else {
        return 0
    }
}()

public let kScreenW: CGFloat = UIScreen.main.bounds.width
public let kScreenH: CGFloat = UIScreen.main.bounds.height

public let kScreenW_4s: CGFloat = 320
public let kScreenH_4s: CGFloat = 480

public let kScreenW_5s: CGFloat = 320
public let kScreenH_5s: CGFloat = 568

public let kScreenW_6s: CGFloat = 375
public let kScreenH_6s: CGFloat = 667

public let kScreenW_6p: CGFloat = 414 // 1242×2208, @3x, 458ppi (1080×1920)
public let kScreenH_6p: CGFloat = 736

public let kScreenW_X: CGFloat = 375  // 1125×2436, @3x, 458ppi
public let kScreenH_X: CGFloat = 812

public let kScreenW_XSM: CGFloat = 414 // 1242×2688, @3x, 458ppi
public let kScreenH_XSM: CGFloat = 896

public let kScreenW_XR: CGFloat = 414 // 828×1792, @2x, 326ppi
public let kScreenH_XR: CGFloat = 896

public let w1: CGFloat = W(1)
public let w2: CGFloat = W(2)
public let w5: CGFloat = W(5)
public let w10: CGFloat = W(10)
public let w15: CGFloat = W(15)
public let w20: CGFloat = W(20)
public let w25: CGFloat = W(25)
public let w30: CGFloat = W(30)









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
