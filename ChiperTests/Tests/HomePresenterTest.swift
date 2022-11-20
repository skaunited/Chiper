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
    
    private func createSUT(mockedData: Bool = false) -> Package {
        let view = HomeViewControllerMock()
        let manager = HomeManagerMock()
        let sut = HomePresenter(view: view, manager: manager)
        if mockedData {
            sut.listingData = (StaticMocks.listingEntity, StaticMocks.categoryArray) as? ListingData
            sut.backupListingEntities = StaticMocks.listingEntity
        }
        
        return (sut, view, manager)
    }
}

extension HomePresenterTest {
    func test_load() {
        // Given
        let package = createSUT()
        // When
        package.sut.didLoad()
        // Then
        XCTAssertTrue(package.manager.getListingDataCallStatus.isCalled)
    }
    
    func test_willShow() {
        // Given
        let package = createSUT(mockedData: true)
        let mockedCell = ItemTableViewCellMock()
        // When
        package.sut.willShow(cell: mockedCell, indexPath: IndexPath(row: 0, section: 0))
        // Then
        XCTAssertTrue(mockedCell.configureCallStatus.isCalled)
        XCTAssertEqual(mockedCell.configureCallStatus.firstCallParam?.titleLabel, package.sut.listingData?.listing[0].title)
        XCTAssertEqual(mockedCell.configureCallStatus.firstCallParam?.description, package.sut.listingData?.listing[0].description)
        XCTAssertEqual(mockedCell.configureCallStatus.firstCallParam?.isUrgent, package.sut.listingData?.listing[0].isUrgent)
    }
    
    func test_numberOfRows() {
        // Given
        let package = createSUT(mockedData: true)
        // When
        let numberofRows = package.sut.numberOfRows(inSection: 0)
        // Then
        XCTAssertEqual(numberofRows, 3)
    }
    
    func test_numberOfSections() {
        // Given
        let package = createSUT(mockedData: true)
        // When
        let numberOfSections = package.sut.numberOfSections()
        // Then
        XCTAssertEqual(numberOfSections, 1)
    }
    
    func test_getCategories() {
        // Given
        let package = createSUT(mockedData: true)
        // When // Then
        XCTAssertEqual(package.sut.getCategories().count, (package.sut.listingData?.categories.count).orDefault)
    }
    
    func test_setFilter_empty() {
        // Given
        let package = createSUT(mockedData: true)
        // When
        package.sut.setFilter(by: nil)
        // Then
        XCTAssertEqual((package.sut.listingData?.listing.count).orDefault, 3)
    }
    
    func test_setFilter_filled() {
        // Given
        let package = createSUT(mockedData: true)
        // When
        package.sut.setFilter(by: Category(id: 4, name: "Maison"))
        // Then
        XCTAssertEqual((package.sut.listingData?.listing.count).orDefault, 2)
    }
    
    func test_reloadData() {
        // Given
        let package = createSUT(mockedData: true)
        // When
        package.sut.setFilter(by: Category(id: 4, name: "Maison"))
        // Then
        XCTAssertTrue(package.view.reloadDataCallStatus.isCalled)
    }
}
