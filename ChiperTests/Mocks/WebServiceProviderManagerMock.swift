//
//  WebServiceProviderManagerMock.swift
//  ChiperTests
//
//  Created by Skander Bahri on 20/11/2022.
//

import XCTest

@testable import Chiper

class WebServiceProviderManagerMock {
    var getAdsDataCallStatus = CallStatus<((Chiper.ListingData?) -> Void)>.none
}

extension WebServiceProviderManagerMock: WebServiceProviderManagerProtocol {
    func getAdsData(completion: @escaping (Chiper.ListingData?) -> Void) {
        getAdsDataCallStatus.iterate(with: completion)
    }
}
