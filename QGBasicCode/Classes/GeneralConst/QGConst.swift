//
//  QGConst.swift
//  SuperGome
//
//  Created by felix_gm on 2019/5/31.
//  Copyright © 2019 Gome. All rights reserved.
//

import Foundation

// MARK:- InfoDic
/// info.plist
public let kInfoDic = Bundle.main.infoDictionary!
/// 命名空间
public let kNameSpace = kInfoDic["CFBundleExecutable"] as! String
/// App构建版本
public let kAppBuild = kInfoDic["CFBundleVersion"] as! String
/// App名称
public let kAppName = kInfoDic["CFBundleDisplayName"] as! String
/// App版本
public let kAppVersion = kInfoDic["CFBundleShortVersionString"] as! String

/// 手机系统版本
public let kSysVersion = Float(UIDevice.current.systemVersion)!


