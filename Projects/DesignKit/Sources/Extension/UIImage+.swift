//
//  UIImage+.swift
//  DesignKit
//
//  Created by 지연 on 10/26/25.
//

import UIKit

public extension UIImage {
    static func image(_ imageName: String?) -> UIImage? {
        guard let imageName = imageName else { return nil }
        return UIImage(named: imageName, in: .module, compatibleWith: nil)
    }
    
    static func image(_ color: UIColor) -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
