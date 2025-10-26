//
//  UIFont+.swift
//  DesignKit
//
//  Created by 지연 on 10/26/25.
//

import UIKit

public extension UIFont {
    static func logo(size: CGFloat) -> UIFont {
        return DesignKitFontFamily.WantedSans.black.font(size: size)
    }
    
    static func regular(size: CGFloat) -> UIFont {
        return DesignKitFontFamily.Pretendard.regular.font(size: size)
    }
    
    static func medium(size: CGFloat) -> UIFont {
        return DesignKitFontFamily.Pretendard.medium.font(size: size)
    }
    
    static func semibold(size: CGFloat) -> UIFont {
        return DesignKitFontFamily.Pretendard.semiBold.font(size: size)
    }
    
    static func bold(size: CGFloat) -> UIFont {
        return DesignKitFontFamily.Pretendard.bold.font(size: size)
    }
}
