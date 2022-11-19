//
//  HomePresenterTest.swift
//  ChiperTests
//
//  Created by Skander Bahri on 20/11/2022.
//
import XCTest

@testable import Chiper

class HomePresenterTest: XCTestCase {
    private typealias Package = (
        sut: HomePresenter,
        view: HomeViewControllerMock,
        manager: HomeManagerMock
    )
    
    private func createSUT() -> Package {
        let view = HomeViewControllerMock()
        let manager = HomeManagerMock()
        let sut = HomePresenter(view: view, manager: manager)

        return (sut, view, manager)
    }
}

extension HomePresenterTest {
    // MARK: DidLoad
    func test_load() {
        // Given
        let package = createSUT()
        // When
        package.sut.didLoad()
        // Then
        XCTAssertTrue(package.manager.getListingDataCallStatus.isCalled)
    }
}
