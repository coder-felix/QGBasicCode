//
//  GMLabel.swift
//  HealthyWater
//
//  Created by felix_rrs on 2018/11/23.
//  Copyright © 2018 felix_rrs. All rights reserved.
//

import UIKit

public class GMLabel: UILabel {
    var autoSize: Bool = false
    var lineSpace: CGFloat = 0.0
    var maxW: CGFloat = 0.0
    public override var text: String? {
        didSet { if autoSize {
            if self.lineSpace > 0 {
                let attrStr = NSMutableAttributedString(attributedString: self.attributedText!)
                let paraStyle = NSMutableParagraphStyle()
                paraStyle.lineSpacing = self.lineSpace
                // NSAttributedString.Key.paragraphStyle   NSParagraphStyleAttributeName
                attrStr.addAttributes([NSAttributedStringKey.paragraphStyle : paraStyle], range: NSRange(location: 0, length: text!.count))
                self.attributedText = attrStr
            }
            self.width = maxW
            self.sizeToFit()
            } }
    }
    
    public override var attributedText: NSAttributedString? {
        didSet {
            if autoSize {
                self.width = maxW
                self.sizeToFit()
            }
        }
    }
    
//    override var frame: CGRect {
//        didSet {
//            self.maxW = frame.width
//        }
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public convenience init(frame: CGRect, text: String = "", font: UIFont = kFont(15), color: UIColor = kWhite, autoSize: Bool = false, lineSpace: CGFloat = 0.0) {
        self.init(frame: frame)

        self.font = font
        self.textColor = color
        self.numberOfLines = (lineSpace == 0.0) ? 1 : 0
        self.maxW = frame.size.width
        self.lineSpace = lineSpace
        self.autoSize = (lineSpace > 0) ? true : autoSize
        self.text = text == "" ? "                                                                                                 " : text
    }
}


