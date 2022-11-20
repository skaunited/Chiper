//
//  HomeViewControllerMock.swift
//  ChiperTests
//
//  Created by Skander Bahri on 19/11/2022.
//

import XCTest

@testable import Chiper

class HomeViewControllerMock {
    var reloadDataCallStatus = CallStatus<Never>.none
}

extension HomeViewControllerMock: HomeViewProtocol {
    func reloadData() {
        reloadDataCallStatus.iterate()
    }
}
