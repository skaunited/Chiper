//
//  ThemedTableViewMock.swift
//  ChiperTests
//
//  Created by Skander Bahri on 19/11/2022.
//

import XCTest

@testable import Chiper

class ThemedTableViewMock {
    var renderTableViewCallStatus = CallStatus<Bool>.none
}

extension ThemedTableViewMock: ThemedTableViewProtocol {
    func renderTableView(translatesAutoresizingMaskIntoConstraints: Bool) -> UITableView {
        renderTableViewCallStatus.iterate(with: translatesAutoresizingMaskIntoConstraints)
        return UITableView()
    }
}
