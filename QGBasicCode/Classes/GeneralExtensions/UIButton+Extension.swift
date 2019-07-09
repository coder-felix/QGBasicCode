//
//  UIButton+Extension.swift
//  QGWB
//
//  Created by felix_rrs on 2018/7/12.
//  Copyright © 2018年 rrs. All rights reserved.
//

import UIKit


private var key: Void?

extension UIButton {
    
    typealias tapHandler = (_ sender: UIButton) -> ()
    
    /// ERROR: Extensions must not contain stored properties
    //    var handler: tapHandler!
    var handler: tapHandler? {
        get {
            return objc_getAssociatedObject(self, &key) as? tapHandler
        }
        set(newValue) {
            objc_setAssociatedObject(self, &key, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }


    /** convenience method */
    convenience init(frame: CGRect? = .zero, title: String? = "", titleColor: UIColor = .gray, fontSize: CGFloat = 15.0, image: UIImage? = nil, handler: tapHandler? = nil) {
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
extension UIButton {
    // MARK: - Title
    func setNormal(title: String?) {
        self.setTitle(title, for: .normal)
    }
    func normalTitle() -> String? {
        return title(for: .normal)
    }
    func setSelected(title: String?) {
        self.setTitle(title, for: .selected)
    }
    func selectedTitle() -> String? {
        return title(for: .selected)
    }
    func setHighlighted(title: String?) {
        self.setTitle(title, for: .highlighted)
    }
    func highlightedTitle() -> String? {
        return title(for: .highlighted)
    }
    
    // MARK: - TitleColor
    func setNormal(titleColor: UIColor?) {
        self.setTitleColor(titleColor, for: .normal)
    }
    func normalTitleColor() -> UIColor? {
        return titleColor(for: .normal)
    }
    func setSelected(titleColor: UIColor?) {
        self.setTitleColor(titleColor, for: .selected)
    }
    func selectedTitleColor() -> UIColor? {
        return titleColor(for: .selected)
    }
    func setHighlighted(titleColor: UIColor?) {
        self.setTitleColor(titleColor, for: .highlighted)
    }
    func highlightedTitleColor() -> UIColor? {
        return titleColor(for: .highlighted)
    }
    
    
    func setDisabled(title: String) {
        self.setTitle(title, for: .disabled)
    }
    func setDisabled(titleColor: UIColor?) {
        self.setTitleColor(titleColor, for: .disabled)
    }
    func setDisabled(backgroundColor: UIColor) {
        self.setBackgroundImage(UIImage(color: backgroundColor), for: .disabled)
    }
    func setDisabled(image: UIImage?) {
        self.setImage(image, for: .disabled)
    }
    
    // MARK: - Image
    func setNormal(image: UIImage?) {
        self.setImage(image, for: .normal)
    }
    func normalImage() -> UIImage? {
        return image(for: .normal)
    }
    func setSelected(image: UIImage?) {
        self.setImage(image, for: .selected)
    }
    func selectedImage() -> UIImage? {
        return image(for: .selected)
    }
    func setHighlighted(image: UIImage?) {
        self.setImage(image, for: .highlighted)
    }
    func highlightedImage() -> UIImage? {
        return image(for: .highlighted)
    }
    
    // MARK: - BackgroundImage
    func setNormal(backgroundImage: UIImage?) {
        self.setBackgroundImage(backgroundImage, for: .normal)
    }
    func normalBackgroundImage() -> UIImage? {
        return backgroundImage(for: .normal)
    }
    func setSelected(backgroundImage: UIImage?) {
        self.setBackgroundImage(backgroundImage, for: .selected)
    }
    func selectedBackgroundImage() -> UIImage? {
        return backgroundImage(for: .selected)
    }
    func setHighlighted(backgroundImage: UIImage?) {
        self.setBackgroundImage(backgroundImage, for: .highlighted)
    }
    func highlightedBackgroundImage() -> UIImage? {
        return backgroundImage(for: .highlighted)
    }
    
//    func setFont(_ font: UIFont) {
//        self.titleLabel?.font = font
//    }
    
    func setNormal(backgroundColor: UIColor) {
        self.setBackgroundImage(UIImage(color: backgroundColor), for: .normal)
    }
    

    
    /// 圆角边框
    func setBorder(borderWidth: CGFloat?, borderColor: UIColor?, cornerRadius: CGFloat?) {
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
        layer.masksToBounds = true
        layer.borderWidth = borderWidth!
        layer.borderColor = borderColor?.cgColor
        layer.cornerRadius = cornerRadius!
    }
}
