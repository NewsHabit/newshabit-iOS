//
//  UIColor+.swift
//  DesignKit
//
//  Created by 지연 on 10/26/25.
//

import UIKit

public extension UIColor {
    static func color(_ colorName: String) -> UIColor? {
        return UIColor(named: colorName, in: .module, compatibleWith: nil)
    }
}
