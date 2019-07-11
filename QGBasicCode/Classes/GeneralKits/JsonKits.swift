//
//  JsonKits.swift
//  HealthyWater
//
//  Created by felix_rrs on 2018/9/17.
//  Copyright © 2018年 海尔优家智能科技（北京）有限公司. All rights reserved.
//

import Foundation

class JsonKits: NSObject {

    
    
    @objc static func readDic(_ jsonName: String) -> [String : Any]? {
        guard let path = Bundle.main.path(forResource: jsonName, ofType: "json") else { return nil }
        guard let data = NSData(contentsOfFile: path) else { return nil }
        guard let dic = try? JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions(rawValue: JSONSerialization.ReadingOptions.RawValue(0))) else { return nil }
        return dic as? [String : Any]
    }
    
    @objc static func readArr(_ jsonName: String) -> [Any]? {
        guard let path = Bundle.main.path(forResource: jsonName, ofType: "json") else { return nil }
        guard let data = NSData(contentsOfFile: path) else { return nil }
        guard let arr = try? JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions(rawValue: JSONSerialization.ReadingOptions.RawValue(0))) else { return nil }
        return arr as? [Any]
    }
    
    
}










