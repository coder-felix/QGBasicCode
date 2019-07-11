//
//  QGTextField.swift
//  HealthyWater
//
//  Created by felix_rrs on 2018/11/7.
//  Copyright © 2018年 felix_rrs. All rights reserved.
//

import UIKit

class QGTextField: UITextField {
    var changedC: TextClosure<UITextField>?
    var doneC: TextClosure<UITextField>?
    convenience init(frame: CGRect, txFont: UIFont, txColor: UIColor, ph: String = "", changedC: TextClosure<UITextField>? = nil, doneC: TextClosure<UITextField>? = nil) {
        self.init(frame: frame)
        self.backgroundColor = kWhite
        self.font = txFont
        self.textColor = txColor
        self.clearButtonMode = .whileEditing
        self.placeholder = ph
        self.changedC = changedC
        self.doneC = doneC
//        self.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        
        self.ck_eventEditingChanged { (textField) in
            if (textField.markedTextRange != nil) { return }
            if let txt = textField.text {
                changedC?(textField, txt)
            }else {
                changedC?(textField, "")
            }
        }
        
        self.ck_didEndEditing { (textField) in
            if (textField.markedTextRange != nil) { return }
            if let txt = textField.text {
                doneC?(textField, txt)
            }else {
                doneC?(textField, "")
            }
        }
        
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: W(20), dy: 0)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: W(20), dy: 0)
    }
    
//    @objc func editingChanged(_ textField: RRSTextField) {
//        if (textField.markedTextRange != nil) { return }
//        if let txt = textField.text {
//            changedC?(txt)
//        }else {
//            changedC?("")
//        }
//    }
}
