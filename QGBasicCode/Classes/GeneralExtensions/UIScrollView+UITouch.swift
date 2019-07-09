//
//  UIScrollView+UITouch.swift
//  HealthyWater
//
//  Created by felix_rrs on 2018/12/10.
//  Copyright © 2018 felix_rrs. All rights reserved.
//

import UIKit

extension UIScrollView {
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.next?.touchesBegan(touches, with: event)
        super.touchesBegan(touches, with: event)
    }
    
    open override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.next?.touchesMoved(touches, with: event)
        super.touchesMoved(touches, with: event)
    }
    
    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.next?.touchesEnded(touches, with: event)
        super.touchesEnded(touches, with: event)
    }
}
