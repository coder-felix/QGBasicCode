//
//  URL+Extension.swift
//  HealthyWater
//
//  Created by felix on 2018/9/16.
//  Copyright © 2018年 海尔优家智能科技（北京）有限公司. All rights reserved.
//

import Foundation


public extension URL {
    
    /// URL+安全校验
    public static func secure(_ string: String) -> URL {
        if string.count > 0, let url = URL(string: string) {
            return url
        }
//        assert(string.count <= 0, "check the url (string = \(string)")
        return URL(string: "https://www.baidu.com/")!
    }
    
}
