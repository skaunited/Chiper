//
//  ThemedUILabel.swift
//  Chiper
//
//  Created by Skander Bahri on 15/11/2022.
//

import UIKit

protocol ThemedUILabelProtocol {
    func renderLabel(textColor: UIColor,
                     backgroundColor: UIColor,
                     cornerRadius: CGFloat?,
                     fontSize: CGFloat,
                     textAlignment: NSTextAlignment,
                     numberOfLines: Int,
                     autoresizing: Bool,
                     isBold: Bool) -> UILabel
    
    func clean(label: UILabel) -> UILabel
}

class ThemedUILabel: UILabel, ThemedUILabelProtocol {
    public static let shared = ThemedUILabel()
    
    func renderLabel(textColor: UIColor,
                     backgroundColor: UIColor,
                     cornerRadius: CGFloat?,
                     fontSize: CGFloat,
                     textAlignment: NSTextAlignment,
                     numberOfLines: Int,
                     autoresizing: Bool,
                     isBold: Bool) -> UILabel {
        let label = UILabel()
        label.textColor = textColor
        label.backgroundColor = backgroundColor
        
        if let cornerRadius = cornerRadius {
            label.layer.cornerRadius = cornerRadius
            label.layer.masksToBounds = true
        }
        
        label.font = isBold ? .boldSystemFont(ofSize: fontSize) : .systemFont(ofSize: fontSize, weight: .regular)
        label.textAlignment = textAlignment
        label.lineBreakMode = .byClipping
        label.numberOfLines = numberOfLines
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = autoresizing
        
        return label
    }
    
    func clean(label: UILabel) -> UILabel {
        label.text = nil
        return label
    }
}
