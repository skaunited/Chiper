//
//  OptionalsExtension.swift
//  Chiper
//
//  Created by Skander Bahri on 15/11/2022.
//

import UIKit

/**
 Extension of optional, gonna working if the the typeof( ) of the value == String
 - returns: Self, if the value, not nil & "" if the value is nil
 */
public extension Optional where Wrapped == String {
    var orEmpty: String { self ?? "" }
}

/**
 Extension of optional, gonna working if the the typeof( ) of the value == Double
 - returns: Self, if the value, not nil & 0 if the value is nil
 */
public extension Optional where Wrapped == Double {
    var orDefault: Double { self ?? 0 }
}

/**
 Extension of optional, gonna working if the the typeof( ) of the value == CGFloat
 - returns: Self, if the value, not nil & 0.0 if the value is nil
 */
public extension Optional where Wrapped == CGFloat {
    var orDefault: CGFloat { self ?? 0.0 }
}

/**
 Extension of optional, gonna working if the the typeof( ) of the value == UIImage
 - returns: Self, if the value, not nil & UIImage( ) if the value is nil
 */
public extension Optional where Wrapped == UIImage {
    var orDefault: UIImage { self ?? UIImage() }
}

/**
 Extension of optional, gonna working if the the typeof( ) of the value == UIImageView
 - returns: Self, if the value, not nil & UIImageView( ) if the value is nil
 */
public extension Optional where Wrapped == UIImageView {
    var orDefault: UIImageView { self ?? UIImageView() }
}

/**
 Extension of optional, gonna working if the the typeof( ) of the value == UINavigationBar
 - returns: Self, if the value, not nil & UINavigationBar( ) if the value is nil
 */
public extension Optional where Wrapped == UINavigationBar {
    var orDefault: UINavigationBar { self ?? UINavigationBar() }
}

/**
 Extension of optional, gonna working if the the typeof( ) of the value == UITableView
 - returns: Self, if the value, not nil & UINavigationBar( ) if the value is nil
 */
public extension Optional where Wrapped == UITableView {
    var orDefault: UITableView { self ?? UITableView() }
}

/**
 Extension of optional, gonna working if the the typeof( ) of the value == UILabel
 - returns: Self, if the value, not nil & UILabel( ) if the value is nil
 */
public extension Optional where Wrapped == UILabel {
    var orDefault: UILabel { self ?? UILabel() }
}

/**
 Extension of optional, gonna working if the the typeof( ) of the value == Int
 - returns: Self, if the value, not nil & 0 if the value is nil
 */
public extension Optional where Wrapped == Int {
    var orDefault: Int { self ?? 0 }
}

/**
 Extension of optional, gonna working if the the typeof( ) of the value == String
 - returns: Self, if the value, not nil & "" if the value is nil
 */
public extension Optional where Wrapped == Bool {
    var orDefault: Bool { self ?? false }
}

/**
 Extension of optional, gonna working if the the typeof( ) of the value == String
 - returns: Self, if the value, not nil & "" if the value is nil
 */
public extension Optional where Wrapped == URL {
    var orDefault: URL { self ?? URL(string: "https://www.google.com")! }
}

