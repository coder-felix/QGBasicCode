//
//  GMConst.swift
//  SuperGome
//
//  Created by felix_gm on 2019/5/31.
//  Copyright © 2019 Gome. All rights reserved.
//

import Foundation

// MARK:- InfoDic
let InfoDic = Bundle.main.infoDictionary!
let NameSpace = InfoDic["CFBundleExecutable"] as! String
let AppVersion = InfoDic["CFBundleShortVersionString"] as! String
let AppBuild = InfoDic["CFBundleVersion"] as! String
let AppName = InfoDic["CFBundleDisplayName"] as! String


// MARK:- typealias of closure
/// 点击闭包类型
typealias ClickClosure = (Int) -> Void

typealias StringClosure = (String) -> Void

typealias TextClosure<T> = (T, String) -> Void

typealias ImageClosure = (UIImage) -> Void

typealias BoolClosure = (Bool) -> Void


func gf_notiCenterPost(_ name: String, obj: Any? = nil) {
    NotificationCenter.default.post(name: NotiName(name), object: obj)
}

func gf_notiCenterObserve(_ name: String, object: Any? = nil, queue: OperationQueue = .main, closure: @escaping (Notification) -> Void) {
    NotificationCenter.default.addObserver(forName: NotiName(name), object: object, queue: queue, using: closure)
}

func NotiName(_ name: String) -> NSNotification.Name {
    return NSNotification.Name(rawValue: name)
}


func gf_setStatusBar(_ color: UIColor) {
    let dic = UIApplication.shared.value(forKey: "statusBarWindow") as! NSObject
    let statusBar = dic.value(forKey: "statusBar") as! UIView
    statusBar.backgroundColor = color
}
