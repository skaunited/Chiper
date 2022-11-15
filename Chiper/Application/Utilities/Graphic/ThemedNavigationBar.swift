//
//  ThemedNavigationBar.swift
//  Chiper
//
//  Created by Skander Bahri on 15/11/2022.
//

import UIKit

protocol ThemedNavigationBarProtocol {
    func renderNavigationBar(backgroundColor: UIColor,
                             barTintColor: UIColor,
                             title: String?,
                             navigationItemBackgroundColor: UIColor,
                             tintColor: UIColor,
                             barButtonAction: UIAction) -> UINavigationBar
}

class ThemedNavigationBar: UINavigationBar, ThemedNavigationBarProtocol {
    lazy var drawer: DrawingProtocol = Drawing.shared
    public static let shared = ThemedNavigationBar()
    
    func renderNavigationBar(backgroundColor: UIColor,
                             barTintColor: UIColor,
                             title: String?,
                             navigationItemBackgroundColor: UIColor,
                             tintColor: UIColor,
                             barButtonAction: UIAction) -> UINavigationBar {
        let navigationBar = UINavigationBar()
        navigationBar.backgroundColor = backgroundColor
        navigationBar.barTintColor = barTintColor
        let navigationItem = UINavigationItem(title: title.orEmpty)
        navigationItem.titleView?.backgroundColor = navigationItemBackgroundColor
        navigationBar.setItems([navigationItem], animated: false)
        let filterButton = UIBarButtonItem(title: nil,
                                           image: drawer.drawIcon(ressourceName: nil,
                                                                  systemName: Constants.filterIcon,
                                                                  size: 20,
                                                                  isSFSymbol: true),
                                           primaryAction: barButtonAction,
                                           menu: nil)
        
        filterButton.tintColor = tintColor
        navigationItem.rightBarButtonItem = filterButton
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        return navigationBar
    }
}
