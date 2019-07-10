//
//  UIViewController+Ext.swift
//  HealthyWater
//
//  Created by felix_rrs on 2018/11/7.
//  Copyright © 2018年 felix_rrs. All rights reserved.
//

import Foundation

public extension UIViewController {
    /// push
    public func gm_push(_ vcClass: UIViewController.Type) {
        let vc = vcClass.init()
        navigationController?.pushViewController(vc, animated: true)
    }
    /// push - 由控制器名(sub to Controller)
    public func gm_push(_ vcName: String) {
        guard let vc = (vcName + "Controller").toControllerClass() else { return }
        gm_push(vc)
    }
}
