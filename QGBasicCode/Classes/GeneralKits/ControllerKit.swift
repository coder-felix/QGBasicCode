//
//  ControllerKit.swift
//  HealthyWater
//
//  Created by felix_rrs on 2018/10/25.
//  Copyright © 2018年 felix_rrs. All rights reserved.
//

import Foundation

public class ControllerKit: NSObject {
    /// 当前控制器
    @objc public static func currentVC() -> UIViewController {
        var topVC = UIApplication.shared.keyWindow?.rootViewController
        while topVC?.presentedViewController != nil {
            topVC = topVC?.presentedViewController!
        }
        if let tab = topVC as? UITabBarController
            , let navi = tab.selectedViewController {
            topVC = navi.childViewControllers.last
        }
        return topVC!
    }
}
