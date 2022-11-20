//
//  ItemTableViewCellMock.swift
//  ChiperTests
//
//  Created by Skander Bahri on 20/11/2022.
//

import XCTest

@testable import Chiper

class ItemTableViewCellMock {
    var configureCallStatus = CallStatus<(ItemTableViewCellModel)>.none
}

extension ItemTableViewCellMock: ItemTableViewCellProtocol {
    func configure(with model: ItemTableViewCellModel) {
        configureCallStatus.iterate(with: model)
    }
}
