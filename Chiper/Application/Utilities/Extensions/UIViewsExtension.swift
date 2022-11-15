//
//  Utilities.swift
//  Chiper
//
//  Created by Skander Bahri on 14/11/2022.
//

import UIKit

extension UIView {
    func anchor (top: NSLayoutYAxisAnchor? = nil,
                 left: NSLayoutXAxisAnchor? = nil,
                 bottom: NSLayoutYAxisAnchor? = nil,
                 right: NSLayoutXAxisAnchor? = nil,
                 centerY: NSLayoutYAxisAnchor? = nil,
                 centerX: NSLayoutXAxisAnchor? = nil,
                 paddingTop: CGFloat = 0,
                 paddingLeft: CGFloat = 0,
                 paddingBottom: CGFloat = 0,
                 paddingRight: CGFloat = 0,
                 paddingWidth: NSLayoutDimension? = nil,
                 width: CGFloat = 0,
                 height: CGFloat = 0,
                 enableInsets: Bool = false) {
        var topInset = CGFloat(0)
        var bottomInset = CGFloat(0)
        
        if #available(iOS 11, *), enableInsets {
            let insets = self.safeAreaInsets
            topInset = insets.top
            bottomInset = insets.bottom
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop+topInset).isActive = true
        }
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom-bottomInset).isActive = true
        }
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let centerY = centerY {
            centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
        if let centerX = centerX {
            centerXAnchor.constraint(equalTo: centerX).isActive = true
        }
        if let paddingWidth = paddingWidth {
            widthAnchor.constraint(equalTo: paddingWidth).isActive = true
        }
    }
}
