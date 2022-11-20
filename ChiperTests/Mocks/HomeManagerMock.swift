//
//  HomeManagerMock.swift
//  ChiperTests
//
//  Created by Skander Bahri on 19/11/2022.
//

import XCTest

@testable import Chiper

class HomeManagerMock {
    var getListingDataCallStatus = CallStatus<(Chiper.ListingData?) -> Void>.none
}

extension HomeManagerMock: HomeManagerProtocol {
    func getListingData(completion: @escaping (Chiper.ListingData?) -> Void) {
        getListingDataCallStatus.iterate(with: completion)
    }
}
