//
//  GCD+Extension.swift
//  HealthyWater
//
//  Created by felix_rrs on 2018/9/29.
//  Copyright © 2018年 海尔优家智能科技（北京）有限公司. All rights reserved.
//

import Foundation

public typealias gm_Task = (_ cancel: Bool) -> Void


/// 延迟执行
@discardableResult
public func gm_delay(_ time: TimeInterval, task: @escaping ()->()) ->  gm_Task? {
    
    func dispatch_later(block: @escaping ()->()) {
        let t = DispatchTime.now() + time
        DispatchQueue.main.asyncAfter(deadline: t, execute: block)
    }
    var closure: (()->Void)? = task
    var result: gm_Task?
    
    let delayedClosure: gm_Task = {
        cancel in
        if let internalClosure = closure {
            if (cancel == false) {
                DispatchQueue.main.async(execute: internalClosure)
            }
        }
        closure = nil
        result = nil
    }
    
    result = delayedClosure
    
    dispatch_later {
        if let delayedClosure = result {
            delayedClosure(false)
        }
    }
    return result
}

/// 取消
public func gm_cancel(_ task: gm_Task?) {
    task?(true)
}


/**
 // 调用
 gm_delay(2) { print("2 秒后输出") }
 
 // 取消
 let task = gm_delay(5) { print("拨打 110") }
 gm_cancel(task)
 */
