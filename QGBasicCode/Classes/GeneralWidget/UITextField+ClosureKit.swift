//
//  UITextField+ClosureKit.swift
//  HealthyWater
//
//  Created by felix_rrs on 2018/12/21.
//  Copyright © 2018 felix_rrs. All rights reserved.
//

import UIKit

extension UITextField {
    
    fileprivate static var CKTextFieldAgentKey = "CKTextFieldAgentKey"
    private var ck_agent: CKTextFieldAgent {
        get {
            if let make = objc_getAssociatedObject(self, &UITextField.CKTextFieldAgentKey) as? CKTextFieldAgent {
                return make
            }else {
                self.ck_agent = CKTextFieldAgent()
                return self.ck_agent
            }
        }
        set { objc_setAssociatedObject(self, &UITextField.CKTextFieldAgentKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN) }
    }
    
    private func rebindDelegate() {
        self.delegate = ck_agent
    }
    
    /// return NO to disallow editing
    @discardableResult public func ck_shouldBeginEditing(handler: @escaping (UITextField) -> Bool) -> Self {
//        ck_agent.shouldBeginEditingC = handler
        if let existingC = ck_agent.shouldBeginEditingC {
            ck_agent.shouldBeginEditingC = { tf in
                return existingC(tf) && handler(tf)
            }
        }else {
            ck_agent.shouldBeginEditingC = handler
        }
        rebindDelegate()
        return self
    }
    
    @discardableResult public func ck_didBeginEditing(handler: @escaping (UITextField) -> Void) -> Self {
//        ck_agent.didBeginEditingC = handler
        if let existingC = ck_agent.didBeginEditingC {
            ck_agent.didBeginEditingC = { tf in
                existingC(tf)
                handler(tf)
            }
        }else {
            ck_agent.didBeginEditingC = handler
        }
        rebindDelegate()
        return self
    }
    
    @discardableResult public func ck_shouldEndEditing(handler: @escaping (UITextField) -> Bool) -> Self {
//        ck_agent.shouldEndEditingC = handler
        if let existingC = ck_agent.shouldEndEditingC {
            ck_agent.shouldEndEditingC = { tf in
                return existingC(tf) && handler(tf)
            }
        }else {
            ck_agent.shouldEndEditingC = handler
        }
        rebindDelegate()
        return self
    }
    
    @discardableResult public func ck_didEndEditing(handler: @escaping (UITextField) -> Void) -> Self {
//        ck_agent.didEndEditingC = handler
        if let existingC = ck_agent.didEndEditingC {
            ck_agent.didEndEditingC = { tf in
                existingC(tf)
                handler(tf)
            }
        }else {
            ck_agent.didEndEditingC = handler
        }
        rebindDelegate()
        return self
    }
    
    @discardableResult public func ck_shouldChangeCharacters(handler: @escaping (UITextField, NSRange, String) -> Bool) -> Self {
//        ck_agent.shouldChangeCharactersC = handler
        if let existingC = ck_agent.shouldChangeCharactersC {
            ck_agent.shouldChangeCharactersC = { tf, range, str in
                return existingC(tf, range, str) && handler(tf, range, str)
            }
        }else {
            ck_agent.shouldChangeCharactersC = handler
        }
        rebindDelegate()
        return self
    }
    
    @discardableResult public func ck_shouldClear(handler: @escaping (UITextField) -> Bool) -> Self {
//        ck_agent.shouldClearC = handler
        if let existingC = ck_agent.shouldClearC {
            ck_agent.shouldClearC = { tf in
                return existingC(tf) && handler(tf)
            }
        }else {
            ck_agent.shouldClearC = handler
        }
        rebindDelegate()
        return self
    }
    
    @discardableResult public func ck_shouldReturn(handler: @escaping (UITextField) -> Bool) -> Self {
//        ck_agent.shouldReturnC = handler
        if let existingC = ck_agent.shouldReturnC {
            ck_agent.shouldReturnC = { tf in
                return existingC(tf) && handler(tf)
            }
        }else {
            ck_agent.shouldReturnC = handler
        }
        
        rebindDelegate()
        return self
    }
    
    @discardableResult public func ck_eventEditingChanged(handler: @escaping (UITextField) -> Void) -> Self {
        if let existingC = ck_agent.eventEditingChangedC {
            ck_agent.eventEditingChangedC = { tf in
                handler(tf)
                existingC(tf)
            }
        }else {
            ck_agent.eventEditingChangedC = handler
        }
        self.addTarget(self.ck_agent, action: #selector(CKTextFieldAgent.eventEditingChanged), for: UIControl.Event.editingChanged)
        return self
    }
    
}

internal class CKTextFieldAgent: NSObject, UITextFieldDelegate {
    
    var shouldBeginEditingC: ((UITextField) -> Bool)?
    var didBeginEditingC: ((UITextField) -> Void)?
    var shouldEndEditingC: ((UITextField) -> Bool)?
    var didEndEditingC: ((UITextField) -> Void)?
    var shouldChangeCharactersC: ((UITextField, NSRange, String) -> Bool)?
    var shouldClearC: ((UITextField) -> Bool)?
    var shouldReturnC: ((UITextField) -> Bool)?
    
    var eventEditingChangedC: ((UITextField) -> Void)?
    
    
    override func responds(to aSelector: Selector!) -> Bool {
        
        let funcMap: [Selector : Any?] = [
            #selector(textFieldShouldBeginEditing(_:)) : shouldBeginEditingC,
            #selector(textFieldDidBeginEditing(_:)) : didBeginEditingC,
            #selector(textFieldShouldEndEditing(_:)) : shouldEndEditingC,
            #selector(textFieldDidEndEditing(_:)) : didEndEditingC,
            #selector(textField(_:shouldChangeCharactersIn:replacementString:)) : shouldChangeCharactersC,
            #selector(textFieldShouldClear(_:)) : shouldClearC,
            #selector(textFieldShouldReturn(_:)) : shouldReturnC,
            #selector(eventEditingChanged(_:)) : eventEditingChangedC,
        ]
        if let c = funcMap[aSelector] { return c != nil }
        
        return super.responds(to: aSelector)
    }
    
    
    @objc func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return shouldBeginEditingC!(textField)
    }
    @objc func textFieldDidBeginEditing(_ textField: UITextField) {
        didBeginEditingC!(textField)
    }
    @objc func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return shouldEndEditingC!(textField)
    }
    @objc func textFieldDidEndEditing(_ textField: UITextField) {
        didEndEditingC!(textField)
    }
    @objc func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return shouldChangeCharactersC!(textField, range, string)
    }
    @objc func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return shouldClearC!(textField)
    }
    @objc func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return shouldReturnC!(textField)
    }
    @objc func eventEditingChanged(_ textField: UITextField) {
        eventEditingChangedC?(textField)
    }
}
