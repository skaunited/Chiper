//
//  DrawingMock.swift
//  ChiperTests
//
//  Created by Skander Bahri on 19/11/2022.
//

import XCTest

@testable import Chiper

class DrawingMock {
    var drawIconCallStatus = CallStatus<(String?, String?, CGFloat?, Bool)>.none
}

extension DrawingMock: DrawingProtocol {
    func drawIcon(ressourceName: String?, systemName: String?, size: CGFloat?, isSFSymbol: Bool) -> UIImage {
        drawIconCallStatus.iterate(with: (ressourceName, systemName, size, isSFSymbol))
        return UIImage()
    }
}
