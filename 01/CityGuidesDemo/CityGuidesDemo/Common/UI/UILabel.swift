//
//  UILabel.swift
//  CityGuidesDemo
//
//  Created by Hanif Sugiyanto on 24/10/18.
//  Copyright © 2018 Personal Organization. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
public class Label: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    override public func prepareForInterfaceBuilder() {
        sharedInit()
    }
    
    func sharedInit() {
        refreshLayout()
    }
    
    func refreshLayout() {
        initLabel()
    }
    
    func initLabel(){
        self.font = UIFont(name: self.fontName, size: self.fontSize)
    }
    
    var fontName: String = "NotoSerif-Regular"
    
    @IBInspectable
    public var fontSize: CGFloat = 12 {
        didSet {
            initLabel()
        }
    }
    
    @IBInspectable
    public var typeLabel: String = "regular" {
        didSet {
            // initLabel()
            if let newFont: LabelType = LabelType(rawValue: self.typeLabel.lowercased()) {
                switch newFont {
                case .bold:
                    self.fontName = "NotoSerif-Bold"
                case .boldItalic:
                    self.fontName = "NotoSerif-BoldItalic"
                case .italic:
                    self.fontName = "NotoSerif-Italic"
                case .regular:
                    self.fontName = "NotoSerif-Regular"
                case .undetected:
                    self.fontName = "NotoSerif-Regular"
                }
            }
            initLabel()
        }
    }
    
}

enum LabelType: String {
    case bold               = "bold"
    case boldItalic         = "bold-italic"
    case italic             = "italic"
    case regular            = "regular"
    case undetected // LOL, typo maybe :D
}

extension UILabel {
    func addTextSpacing(_ spacing: CGFloat){
        let attributedString = NSMutableAttributedString(string: text!)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: spacing, range: NSRange(location: 0, length: text!.count))
        attributedText = attributedString
    }
}

