//
//  CoordinatorMock.swift
//  ChiperTests
//
//  Created by Skander Bahri on 19/11/2022.
//

import XCTest

@testable import Chiper

class CoordinatorMock {
    var startCallStatus = CallStatus<Never>.none
    
    let navigationController: UINavigationController?
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension CoordinatorMock: CoordinatorProtocol {
    func start() {
        startCallStatus.iterate()
    }
}
