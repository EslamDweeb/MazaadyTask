//
//  UIColor_Ext.swift
//  Leedo
//
//  Created by eslam dweeb on 21/09/2022.
//

import UIKit
extension UIColor {
    
    static let primry:UIColor = UIColor(hex: "#EC5F5F")
    static let midnightBlue:UIColor = .init(hex: "#15151E")
    static let shamrockGreen:UIColor = .init(hex: "#00A962")
    static let vividOrange:UIColor = .init(hex: "#FF4100")
    static let tan:UIColor = .init(hex: "#D49F76")
    static let goldenrod:UIColor = .init(hex: "FFC02F")
    static let ashGray:UIColor = .init(hex: "#B0B0B0")
    static let whisperWhite:UIColor = .init(hex: "#F0EEEB")
    static let lightGray:UIColor = .init(hex: "#D4D4D4")
    static let mintGreen:UIColor = .init(hex: "#B3E6D0")
    static let borderColor:UIColor = .init(hex: "#EAE9EC")
    
    
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        let hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        
        if hexString.hasPrefix("#") {
            scanner.currentIndex = hex.index(after: hexString.startIndex)
        }
        
        var hexValue: UInt64 = 0
        if scanner.scanHexInt64(&hexValue) {
            let red = CGFloat((hexValue & 0xFF0000) >> 16) / 255.0
            let green = CGFloat((hexValue & 0x00FF00) >> 8) / 255.0
            let blue = CGFloat(hexValue & 0x0000FF) / 255.0
            
            self.init(red: red, green: green, blue: blue, alpha: alpha)
        } else {
            fatalError("Invalid hex string: \(hexString)")
        }
    }
}
