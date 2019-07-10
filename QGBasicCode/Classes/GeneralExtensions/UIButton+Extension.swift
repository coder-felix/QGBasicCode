//
//  UIButton+Extension.swift
//  QGWB
//
//  Created by felix_rrs on 2018/7/12.
//  Copyright © 2018年 rrs. All rights reserved.
//

import UIKit


private var key: Void?

public extension UIButton {
    
    public typealias tapHandler = (_ sender: UIButton) -> ()
    
    /// ERROR: Extensions must not contain stored properties
    //    var handler: tapHandler!
    public var handler: tapHandler? {
        get {
            return objc_getAssociatedObject(self, &key) as? tapHandler
        }
        set(newValue) {
            objc_setAssociatedObject(self, &key, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }


    /** convenience method */
    public convenience init(frame: CGRect? = .zero, title: String? = "", titleColor: UIColor = .gray, fontSize: CGFloat = 15.0, image: UIImage? = nil, handler: tapHandler? = nil) {
        self.init()
        if let frm = frame { self.frame = frm }
        
        self.titleLabel?.textAlignment = NSTextAlignment.center
        self.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        
        self.setTitleColor(titleColor, for: .normal)
        self.setTitle(title, for: .normal)
        self.setImage(image, for: .normal)
    
        self.handler = handler
    
        self.addTarget(self, action: #selector(btnClick(btn:)), for: .touchUpInside)
    }
    
    @objc func btnClick(btn: UIButton) {
        if let handler = self.handler {
            handler(btn)
        }
    }
}


/// 快速设置
public extension UIButton {
    // MARK: - Title
    public func setNormal(title: String?) {
        self.setTitle(title, for: .normal)
    }
    public func normalTitle() -> String? {
        return title(for: .normal)
    }
    public func setSelected(title: String?) {
        self.setTitle(title, for: .selected)
    }
    public func selectedTitle() -> String? {
        return title(for: .selected)
    }
    public func setHighlighted(title: String?) {
        self.setTitle(title, for: .highlighted)
    }
    public func highlightedTitle() -> String? {
        return title(for: .highlighted)
    }
    
    // MARK: - TitleColor
    public func setNormal(titleColor: UIColor?) {
        self.setTitleColor(titleColor, for: .normal)
    }
    public func normalTitleColor() -> UIColor? {
        return titleColor(for: .normal)
    }
    public func setSelected(titleColor: UIColor?) {
        self.setTitleColor(titleColor, for: .selected)
    }
    public func selectedTitleColor() -> UIColor? {
        return titleColor(for: .selected)
    }
    public func setHighlighted(titleColor: UIColor?) {
        self.setTitleColor(titleColor, for: .highlighted)
    }
    public func highlightedTitleColor() -> UIColor? {
        return titleColor(for: .highlighted)
    }
    
    
    public func setDisabled(title: String) {
        self.setTitle(title, for: .disabled)
    }
    public func setDisabled(titleColor: UIColor?) {
        self.setTitleColor(titleColor, for: .disabled)
    }
    public func setDisabled(backgroundColor: UIColor) {
        self.setBackgroundImage(UIImage(color: backgroundColor), for: .disabled)
    }
    public func setDisabled(image: UIImage?) {
        self.setImage(image, for: .disabled)
    }
    
    // MARK: - Image
    public func setNormal(image: UIImage?) {
        self.setImage(image, for: .normal)
    }
    public func normalImage() -> UIImage? {
        return image(for: .normal)
    }
    public func setSelected(image: UIImage?) {
        self.setImage(image, for: .selected)
    }
    public func selectedImage() -> UIImage? {
        return image(for: .selected)
    }
    public func setHighlighted(image: UIImage?) {
        self.setImage(image, for: .highlighted)
    }
    public func highlightedImage() -> UIImage? {
        return image(for: .highlighted)
    }
    
    // MARK: - BackgroundImage
    public func setNormal(backgroundImage: UIImage?) {
        self.setBackgroundImage(backgroundImage, for: .normal)
    }
    public func normalBackgroundImage() -> UIImage? {
        return backgroundImage(for: .normal)
    }
    public func setSelected(backgroundImage: UIImage?) {
        self.setBackgroundImage(backgroundImage, for: .selected)
    }
    public func selectedBackgroundImage() -> UIImage? {
        return backgroundImage(for: .selected)
    }
    public func setHighlighted(backgroundImage: UIImage?) {
        self.setBackgroundImage(backgroundImage, for: .highlighted)
    }
    public func highlightedBackgroundImage() -> UIImage? {
        return backgroundImage(for: .highlighted)
    }
    
    public func setFont(_ font: UIFont) {
        self.titleLabel?.font = font
    }
    
    public func setNormal(backgroundColor: UIColor) {
        self.setBackgroundImage(UIImage(color: backgroundColor), for: .normal)
    }
    

    
    /// 圆角边框
    public func setBorder(borderWidth: CGFloat?, borderColor: UIColor?, cornerRadius: CGFloat?) {
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
        layer.masksToBounds = true
        layer.borderWidth = borderWidth!
        layer.borderColor = borderColor?.cgColor
        layer.cornerRadius = cornerRadius!
    }
}
