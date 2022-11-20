//
//  UIAlertActionExtension.swift
//  Chiper
//
//  Created by Skander Bahri on 19/11/2022.
//

import UIKit

public extension UIAlertAction {
    var titleTextColor: UIColor? {
        get {
            return self.value(forKey: "titleTextColor") as? UIColor
        } set {
            self.setValue(newValue, forKey: "titleTextColor")
        }
    }
}
