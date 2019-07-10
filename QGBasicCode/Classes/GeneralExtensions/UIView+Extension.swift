//
//  UIView+Extension.swift
//  HealthyWater
//
//  Created by felix_rrs on 2018/12/10.
//  Copyright © 2018 felix_rrs. All rights reserved.
//

import UIKit

public extension UIView {
    /// 移除所有子视图
    public func removeSubviews() {
        for sub in self.subviews {
            sub.removeFromSuperview()
        }
    }
}


