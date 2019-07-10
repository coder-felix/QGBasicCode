//
//  String+Extension.swift
//  QGWB
//
//  Created by felix_rrs on 2018/7/13.
//  Copyright © 2018年 rrs. All rights reserved.
//

import UIKit


public extension String {
    
    /// 根据开始位置和长度截取字符串
    public func subString(start:Int, length:Int = -1) -> String {
        var len = length
        if len == -1 {
            len = self.count - start
        }
        let st = self.index(startIndex, offsetBy:start)
        let en = self.index(st, offsetBy:len)
        return String(self[st ..< en])
    }
    
    /// 赋值非空字符串
    public mutating func setNew(_ str: String) {
        if str.count > 0 {
            self = str
        }
    }
    
    /// placeholder
    public func ph(_ str: String) -> String {
        return self.count > 0 ? self : str
    }
}


// Mark:- 字符串转类
public extension String {
    /// String -> 类
    public func toClass() -> AnyClass? {
        if let cls = NSClassFromString(NameSpace + "." + self) {
            return cls
        }else if let cls = NSClassFromString(self) {
            return cls
        }else {
            print("未找到class")
            return nil
        }
    }
    /// String -> UIViewController类
    public func toControllerClass() -> UIViewController.Type? {
        guard let cls = self.toClass() else { return nil }
        guard let vc = cls as? UIViewController.Type else { return nil }
        return vc
    }
}

// Mark:- 字符串增加下表索引
public extension String {
    public subscript(index:Int) -> String {
        get { return String(self[self.index(self.startIndex, offsetBy: index)]) }
        set {
            let tmp = self
            self = ""
            for (idx, item) in tmp.enumerated() {
                if idx == index { self += "\(newValue)" }
                else { self += "\(item)" }
            }
        }
    }
}


