//
//  ItemTableViewCellTest.swift
//  ChiperTests
//
//  Created by Skander Bahri on 20/11/2022.
//

import XCTest

@testable import Chiper

class ItemTableViewCellTest: XCTestCase {
    private typealias Package = (
        sut: ItemTableViewCell,
        model: ItemTableViewCellModel,
        themedLabel: ThemedUILabelMock,
        themedUIImageView: ThemedUIImageViewMock
    )
    
    private func createSUT() -> Package {
        let sut = ItemTableViewCell()
        let model = ItemTableViewCellModel(titleLabel: "Statue homme noir assis en plâtre polychrome",
                                           description: "Magnifique Statuette homme noir assis fumant le cigare en terre cuite et plâtre polychrome réalisée à la main.",
                                           price: "140",
                                           categoryLabel: "Véhicule",
                                           imageUrl: "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-thumb/2c9563bbe85f12a5dcaeb2c40989182463270404.jpg",
                                           creationDate: Date(),
                                           isUrgent: true)
        let themedLabel = ThemedUILabelMock()
        let themedImageView = ThemedUIImageViewMock()
        sut.themedLabel = themedLabel
        sut.themedUIImageView = themedImageView
        
        return (sut, model, themedLabel, themedImageView)
    }
}

extension ItemTableViewCellTest {
    func test_configure() {
        // Given
        let package = createSUT()
        // When
        package.sut.configure(with: package.model)
        // Then
        XCTAssertEqual(package.sut.titleLabel?.text, package.model.titleLabel)
        XCTAssertEqual(package.sut.titleLabel?.text, package.model.titleLabel)
        XCTAssertEqual(package.sut.priceLabel?.text, package.model.price)
        XCTAssertEqual(package.sut.categoryLabel?.text, package.model.categoryLabel)
        XCTAssertEqual(package.sut.urgentLabel?.text, Constants.urgently)
        XCTAssertEqual(package.sut.descriptionLabel?.text, package.model.description)
    }
    
    func test_cleanUI() {
        // Given
        let package = createSUT()
        // When
        package.sut.cleanUI()
        // Then
        XCTAssertTrue(package.themedLabel.cleanCallStatus.isCalled)
        XCTAssertTrue(package.themedUIImageView.cleanCallStatus.isCalled)
    }
    
    func test_setupLabels() {
        // Given
        let package = createSUT()
        // When
        package.sut.setupLabels()
        // Then
        XCTAssertTrue(package.themedLabel.renderLabelCallStatus.isCalled)
    }
    
    func test_setupImgeItem() {
        // Given
        let package = createSUT()
        // When
        package.sut.setupImgeItem()
        // Then
        XCTAssertTrue(package.themedUIImageView.renderUIImageViewCallStatus.isCalled)
    }
}

