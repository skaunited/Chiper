//
//  HomeViewControllerTest.swift
//  ChiperTests
//
//  Created by Skander Bahri on 20/11/2022.
//

import XCTest

@testable import Chiper

class HomeViewControllerTest: XCTestCase {
    private typealias Package = (
        sut: HomeViewController,
        presenter: HomePresenterMock,
        navigationBar: ThemedNavigationBarMock,
        tableView: ThemedTableViewMock,
        activityIndicator: ThemedActivityIndicatorViewMock
    )
    
    private func createSUT() -> Package {
        let sut = HomeViewController()
        let presenter = HomePresenterMock()
        let drawer = DrawingMock()
        let themedNavigationBar = ThemedNavigationBarMock()
        let themedTableView = ThemedTableViewMock()
        let themedIndicatorView = ThemedActivityIndicatorViewMock()
        sut.presenter = presenter
        sut.drawer = drawer
        sut.themedNavigationBar = themedNavigationBar
        sut.themedTableView = themedTableView
        sut.themedIndicatorView = themedIndicatorView
        
        return (sut, presenter, themedNavigationBar, themedTableView, themedIndicatorView)
    }
}

extension HomeViewControllerTest {
    func test_load() {
        // Given
        let package = createSUT()
        // When
        package.sut.viewDidLoad()
        // Then
        XCTAssertTrue(package.presenter.didLoadCallStatus.isCalled)
        XCTAssertTrue(package.activityIndicator.renderIndicatorViewCallStatus.isCalled)
        XCTAssertTrue(package.tableView.renderTableViewCallStatus.isCalled)
        XCTAssertTrue(package.navigationBar.renderNavigationBarCallStatus.isCalled)
    }
}

