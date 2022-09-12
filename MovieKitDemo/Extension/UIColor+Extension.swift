//
//  UIColor+Extension.swift
//  MovieKitDemo
//
//  Created by Lyman Li on 2022/9/12.
//  Copyright © 2022 Lyman Li. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, alpha: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        assert(alpha >= 0 && alpha <= 255, "Invalid alpha component")

        self.init(red: CGFloat(red) / 255.0,
                  green: CGFloat(green) / 255.0,
                  blue: CGFloat(blue) / 255.0,
                  alpha: CGFloat(alpha) / 255.0)
    }

    convenience init(rgba: Int) {
        self.init(
            red: (rgba >> 24) & 0xFF,
            green: (rgba >> 16) & 0xFF,
            blue: (rgba >> 8) & 0xFF,
            alpha: rgba & 0xFF
        )
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 24) & 0xFF,
            green: (rgb >> 16) & 0xFF,
            blue: (rgb >> 8) & 0xFF,
            alpha: 255
        )
    }
}
