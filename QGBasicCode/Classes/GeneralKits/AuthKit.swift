//
//  AuthKit.swift
//  HealthyWater
//
//  Created by felix_rrs on 2018/10/25.
//  Copyright © 2018年 felix_rrs. All rights reserved.
//

import Foundation


public class AuthKit: NSObject {
    fileprivate static func checkAuthorizationForNoti() -> Bool {
        if kSysVersion >= 8.0 {
            guard let setting = UIApplication.shared.currentUserNotificationSettings else { return false }
            return setting.types != UIUserNotificationType.init(rawValue: 0)
        }else {
            return false // 8.0以下未适配
        }
    }
    
    public static func checkAuthorizationForNotiOnMainThread() -> Bool {
        var authed = false
        if Thread.current.isMainThread {
            authed = AuthKit.checkAuthorizationForNoti()
        }else {
            DispatchQueue.main.sync {
                authed = AuthKit.checkAuthorizationForNoti()
            }
        }
        return authed
    }
    
    /// 跳转到系统设置
    public static func openSysSetting() {
        DispatchQueue.main.async {
            let app = UIApplication.shared
            guard let url = URL(string: UIApplicationOpenSettingsURLString) else { return }
            if app.canOpenURL(url) {
                app.openURL(url)
            }
        }
    }
    
}


