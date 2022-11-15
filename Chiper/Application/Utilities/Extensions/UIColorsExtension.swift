//
//  Colors.swift
//  Chiper
//
//  Created by Skander Bahri on 14/11/2022.
//

import UIKit

public extension UIColor {

    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        guard let int = Scanner(string: hex).scanInt32(representation: .hexadecimal) else {
            self.init(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            return
        }

        let a, r, g, b: Int32
        switch hex.count {
        case 3:     (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)  // RGB (12-bit)
        case 6:     (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)                    // RGB (24-bit)
        case 8:     (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)       // ARGB (32-bit)
        default:    (a, r, g, b) = (255, 0, 0, 0)
        }

        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }

    func toHexString() -> String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let rgb: Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0

        return String(format:"#%06x", rgb)
    }
}


extension UIColor {
    /// White
    public static let BC0 = colorFromResources(themeColors: ThemeColors.bc0)
    /// Dark white
    public static let BC1 = colorFromResources(themeColors: ThemeColors.bc1)
    /// Gray
    public static let BC2 = colorFromResources(themeColors: ThemeColors.bc2)
    /// Black
    public static let BC3 = colorFromResources(themeColors: ThemeColors.bc3)
    /// Red
    public static let BC4 = colorFromResources(themeColors: ThemeColors.bc4)
    /// Green
    public static let BC5 = colorFromResources(themeColors: ThemeColors.bc5)
    
    public static func colorFromResources(themeColors: ThemeColors) -> UIColor {
        mockedColor(themeColors: themeColors)
    }

    private static func mockedColor(themeColors: ThemeColors) -> UIColor {
        switch themeColors {
        case .bc0:
            return UIColor(hexString: "FFFFFF") // White
        case .bc1:
            return UIColor(hexString: "EFF1F4") // Dark white
        case .bc2:
            return UIColor(hexString: "76848B") // Grey
        case .bc3:
            return UIColor(hexString: "242C37") // Black
        case .bc4:
            return UIColor(hexString: "EF3D55") // Red
        case .bc5:
            return UIColor(hexString: "00C853") // Green
        }
    }
}

public enum ThemeColors: String, CaseIterable {
    case bc0 = "BC0"
    case bc1 = "BC1"
    case bc2 = "BC2"
    case bc3 = "BC3"
    case bc4 = "BC4"
    case bc5 = "BC5"
}


