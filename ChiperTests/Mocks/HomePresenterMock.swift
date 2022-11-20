//
//  HomePresenterMock.swift
//  ChiperTests
//
//  Created by Skander Bahri on 19/11/2022.
//

import XCTest

@testable import Chiper

class HomePresenterMock {
    var didLoadCallStatus = CallStatus<Never>.none
    var willShowCallStatus = CallStatus<(ItemTableViewCellProtocol, IndexPath)>.none
    var getCategoriesCallStatus = CallStatus<Never>.none
    var setFilterCallStatus = CallStatus<Chiper.Category?>.none
    var cellIdentifierCallStatus = CallStatus<IndexPath>.none
    var numberOfSectionsCallStatus = CallStatus<Never>.none
    var numberOfRowsCallStatus = CallStatus<Int>.none
    var didSelectCallStatus = CallStatus<IndexPath>.none
}

extension HomePresenterMock: HomePresenterProtocol {
    func didLoad() {
        didLoadCallStatus.iterate()
    }
    
    func willShow(cell: ItemTableViewCellProtocol, indexPath: IndexPath) {
        willShowCallStatus.iterate(with: (cell, indexPath))
    }
    
    func getCategories() -> [Chiper.Category] {
        getCategoriesCallStatus.iterate()
        return StaticMocks.categoryArray
    }
    
    func setFilter(by category: Chiper.Category?) {
        setFilterCallStatus.iterate(with: category)
    }
    
    func cellIdentifier(forIndexPath indexPath: IndexPath) -> String? {
        cellIdentifierCallStatus.iterate(with: indexPath)
        return "ItemTableViewCell"
    }
    
    func numberOfSections() -> Int {
        numberOfRowsCallStatus.iterate()
        return 1
    }
    
    func numberOfRows(inSection: Int) -> Int {
        numberOfRowsCallStatus.iterate(with: inSection)
        return StaticMocks.listingEntity.count
    }
    
    func didSelect(at indexPath: IndexPath) {
        didSelectCallStatus.iterate(with: indexPath)
    }
}
