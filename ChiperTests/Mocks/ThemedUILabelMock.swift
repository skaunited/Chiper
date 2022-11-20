//
//  ThemedUILabelMock.swift
//  ChiperTests
//
//  Created by Skander Bahri on 19/11/2022.
//

import XCTest

@testable import Chiper

class ThemedUILabelMock {
    var renderLabelCallStatus = CallStatus<(UIColor, UIColor, CGFloat?, CGFloat, NSTextAlignment, Int, Bool, Bool)>.none
    var cleanCallStatus = CallStatus<UILabel>.none
}

extension ThemedUILabelMock: ThemedUILabelProtocol {
    func renderLabel(textColor: UIColor,
                     backgroundColor: UIColor,
                     cornerRadius: CGFloat?,
                     fontSize: CGFloat,
                     textAlignment: NSTextAlignment,
                     numberOfLines: Int,
                     autoresizing: Bool,
                     isBold: Bool) -> UILabel {
        renderLabelCallStatus.iterate(with: (textColor, backgroundColor, cornerRadius, fontSize, textAlignment, numberOfLines, autoresizing, isBold))
        return UILabel()
    }
    
    func clean(label: UILabel) -> UILabel {
        cleanCallStatus.iterate(with: label)
        return UILabel()
    }
}
