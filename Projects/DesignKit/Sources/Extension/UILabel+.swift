//
//  UILabel+.swift
//  DesignKit
//
//  Created by 지연 on 10/26/25.
//

import UIKit

public extension UILabel {
    func setLineHeight(_ value: CGFloat) {
        let (attr, fullRange) = preparedAttributedString()
        
        attr.enumerateAttribute(.paragraphStyle, in: fullRange) { existing, range, _ in
            let base = (existing as? NSParagraphStyle) ?? .default
            let style = base.mutableCopy() as! NSMutableParagraphStyle
            style.minimumLineHeight = value
            style.maximumLineHeight = value
            style.alignment = textAlignment
            attr.addAttribute(.paragraphStyle, value: style, range: range)
        }
        
        let offset = (value - font.lineHeight) / 2
        attr.addAttribute(.baselineOffset, value: offset, range: fullRange)
        
        self.attributedText = attr
    }
    
    func applyColor(to targetText: String, color: UIColor) {
        applyAttributes(to: targetText, attributes: [.foregroundColor: color])
    }
    
    func applyFont(to targetText: String, font: UIFont) {
        applyAttributes(to: targetText, attributes: [.font: font])
    }
    
    func applyUnderline(
        to targetText: String,
        color: UIColor? = nil,
        style: NSUnderlineStyle = .single
    ) {
        var attrs: [NSAttributedString.Key: Any] = [.underlineStyle: style.rawValue]
        attrs[.underlineColor] = (color ?? self.textColor) as Any
        applyAttributes(to: targetText, attributes: attrs)
    }
}

private extension UILabel {
    func applyAttributes(
        to targetText: String,
        attributes: [NSAttributedString.Key: Any]
    ) {
        guard !targetText.isEmpty else { return }
        
        let (attr, _) = preparedAttributedString()
        let fullText = (attr.string as NSString)
        var searchRange = NSRange(location: 0, length: fullText.length)
        
        attr.beginEditing()
        defer { attr.endEditing() }
        
        while true {
            let found = fullText.range(
                of: targetText,
                options: .literal,
                range: searchRange
            )
            if found.location == NSNotFound { break }
            attr.addAttributes(attributes, range: found)
            
            let nextLocation = found.location + found.length
            if nextLocation >= fullText.length { break }
            searchRange = NSRange(location: nextLocation, length: fullText.length - nextLocation)
        }
        
        self.attributedText = attr
    }
    
    func preparedAttributedString() -> (NSMutableAttributedString, NSRange) {
        let base: NSMutableAttributedString
        if let existing = self.attributedText, existing.length > 0 {
            base = NSMutableAttributedString(attributedString: existing)
        } else {
            let plain = self.text ?? ""
            base = NSMutableAttributedString(string: plain)
            base.addAttributes(
                [.font: self.font as Any, .foregroundColor: self.textColor as Any],
                range: NSRange(location: 0, length: base.length)
            )
        }
        let range = NSRange(location: 0, length: base.length)
        return (base, range)
    }
}
