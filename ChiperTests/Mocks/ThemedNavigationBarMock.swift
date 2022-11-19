//
//  ThemedNavigationBarMock.swift
//  ChiperTests
//
//  Created by Skander Bahri on 19/11/2022.
//

import XCTest

@testable import Chiper

class ThemedNavigationBarMock {
    var renderNavigationBarCallStatus = CallStatus<(UIColor, UIColor, String?, UIColor, UIColor, UIAction)>.none
}

extension ThemedNavigationBarMock: ThemedNavigationBarProtocol {
    func renderNavigationBar(backgroundColor: UIColor,
                             barTintColor: UIColor,
                             title: String?,
                             navigationItemBackgroundColor: UIColor,
                             tintColor: UIColor,
                             barButtonAction: UIAction) -> UINavigationBar {
        renderNavigationBarCallStatus.iterate(with: (backgroundColor, barTintColor, title, navigationItemBackgroundColor, tintColor, barButtonAction))
        return UINavigationBar()
    }
}

