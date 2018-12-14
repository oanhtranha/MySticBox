//
//  UIColor+Extensions.swift
//  MySticBox
//
//  Created by Oanh tran on 12/14/18.
//  Copyright © 2018 Oanh Tran. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(r: Int, g: Int, b: Int, alpha: CGFloat = 1) {
        self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
    }
    
    convenience init(hex: Int, alpha: CGFloat = 1) {
        let red = (hex >> 16) & 0xFF
        let green = (hex >> 8) & 0xFF
        let blue = (hex) & 0xFF
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }
    
    class var bp_buttonTitleBlueColor: UIColor {
        return UIColor(hex: 0x3884FF)
    }
    
}
