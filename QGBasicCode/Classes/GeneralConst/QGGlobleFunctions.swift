//
//  QGGlobleFunctions.swift
//  Pods-QGBasicCode_Example
//
//  Created by felix_gm on 2019/7/11.
//

import Foundation

// MARK:- typealias of closure
/// 点击闭包类型
public typealias ClickClosure = (Int) -> Void

public typealias StringClosure = (String) -> Void

public typealias TextClosure<T> = (T, String) -> Void

public typealias ImageClosure = (UIImage) -> Void

public typealias BoolClosure = (Bool) -> Void


public func gf_notiCenterPost(_ name: String, obj: Any? = nil) {
    NotificationCenter.default.post(name: NotiName(name), object: obj)
}

public func gf_notiCenterObserve(_ name: String, object: Any? = nil, queue: OperationQueue = .main, closure: @escaping (Notification) -> Void) {
    NotificationCenter.default.addObserver(forName: NotiName(name), object: object, queue: queue, using: closure)
}

public func NotiName(_ name: String) -> NSNotification.Name {
    return NSNotification.Name(rawValue: name)
}


public func gf_setStatusBar(_ color: UIColor) {
    let dic = UIApplication.shared.value(forKey: "statusBarWindow") as! NSObject
    let statusBar = dic.value(forKey: "statusBar") as! UIView
    statusBar.backgroundColor = color
}
