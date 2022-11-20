//
//  HomeManagerTest.swift
//  ChiperTests
//
//  Created by Skander Bahri on 20/11/2022.
//

import XCTest

@testable import Chiper

class HomeManagerTest: XCTestCase {
    private typealias Package = (
        sut: HomeManager,
        webServiceProviderManager: WebServiceProviderManagerMock
    )
    
    private func createSUT() -> Package {
        let sut = HomeManager()
        let webServiceProviderManager = WebServiceProviderManagerMock()
        sut.webServiceProviderManager = webServiceProviderManager
        return (sut, webServiceProviderManager)
    }
}

extension HomeManagerTest {
    func test_getListingData() {
        // Given
        let package = createSUT()
        // When
        package.sut.getListingData { listingData in
            
        }
        // Then
        XCTAssertTrue(package.webServiceProviderManager.getAdsDataCallStatus.isCalled)
    }
}
