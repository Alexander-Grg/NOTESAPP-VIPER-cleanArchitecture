//
//  UIColor + Extension.swift
//  EffectiveMobile_TestTask
//
//  Created by Alexander Grigoryev on 19/11/24.
//

import UIKit

extension UIColor {
    convenience init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        
        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else { return nil }
        
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

enum AppColor {
    case yellowSpecial
    
    var color: UIColor {
        switch self {
        case .yellowSpecial:
            return UIColor(hex: "#FED702") ?? .yellow
        }
    }
}
