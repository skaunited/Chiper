//
//  ThemedActivityIndicatorViewMock.swift
//  ChiperTests
//
//  Created by Skander Bahri on 19/11/2022.
//

import XCTest

@testable import Chiper

class ThemedActivityIndicatorViewMock {
    var renderIndicatorViewCallStatus = CallStatus<Never>.none
}

extension ThemedActivityIndicatorViewMock: ThemedActivityIndicatorViewProtocol {
    func renderIndicatorView() -> UIActivityIndicatorView {
        renderIndicatorViewCallStatus.iterate()
        return UIActivityIndicatorView()
    }
}
