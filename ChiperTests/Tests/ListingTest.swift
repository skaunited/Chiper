//
//  ListingTest.swift
//  ChiperTests
//
//  Created by Skander Bahri on 20/11/2022.
//

import XCTest

@testable import Chiper

class ListingTest: XCTestCase {
    
    private func createSUT() -> Listing {
        Listing(listingId: 4,
                categoryId: 4,
                price: 140,
                title: "Hello from the first ad",
                date: "23/02/2022",
                description: "description of the first ad",
                image: Image(small: "small", thumb: "thumb"),
                isUrgent: true)
    }
}

extension ListingTest {
    func test_asEntity() {
        // Given
        let package = createSUT()
        // When
        let entity = package.asEntity(categories: [Category(id: 4, name: "Maison")] )
        // Then
        XCTAssertEqual(entity.title , "Hello from the first ad")
    }
}
