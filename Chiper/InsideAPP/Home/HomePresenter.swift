//
//  HomeViewPresenter.swift
//  Chiper
//
//  Created by Skander Bahri on 13/11/2022.
//

import Foundation

class HomePresenter {
    var view: HomeViewProtocol?
    var manager: HomeManagerProtocol?
    var tableViewArray: [ItemTableViewCellModel] = []
    var listingData: ListingData?
    var backupListingEntities: ListingEntities?
    
    lazy var themedImageView: ThemedUIImageViewProtocol = ThemedUIImageView.shared
    
    init(view: HomeViewProtocol? = nil, manager: HomeManagerProtocol?) {
        self.view = view
        self.manager = manager
    }
}

extension HomePresenter: HomePresenterProtocol {
    func didLoad() {
        manager?.getListingData(completion: { [weak self] listingData in
            guard let self = self else { return }
            self.listingData = listingData
            self.backupListingEntities = listingData?.listing
            self.view?.reloadData()
        })
    }
    
    func willShow(cell: ItemTableViewCellProtocol, indexPath: IndexPath) {
        guard let item = listingData?.listing.getOrNull(indexPath.row),
              let category = listingData?.categories
        else {
            return
        }
        let model = ItemTableViewCellModel(titleLabel: item.title.orEmpty,
                                           description: item.description.orEmpty,
                                           price: "\(item.price.orDefault) €",
                                           categoryLabel: (category.first { $0.id == item.category?.id }?.name).orEmpty,
                                           imageUrl: item.image.orEmpty,
                                           creationDate: Date(),
                                           isUrgent: item.isUrgent.orDefault)
        cell.configure(with: model)
    }
    
    func numberOfRows(inSection: Int) -> Int {
        (listingData?.listing.count).orDefault
    }
    
    func cellIdentifier(forIndexPath indexPath: IndexPath) -> String? {
        Constants.cellIdentifier
    }
    
    func numberOfSections() -> Int {
        1
    }
    
    func didSelect(at indexPath: IndexPath) {}
    
    func getCategories() -> [Category] {
        listingData?.categories ?? []
    }
    
    func setFilter(by category: Category?) {
        guard let category = category else {
            self.listingData?.listing = backupListingEntities ?? []
            self.view?.reloadData()
            return
        }
        let filtredData = self.listingData?.listing.compactMap { $0.category?.id == category.id ? $0 : nil } ?? []
        self.listingData?.listing = filtredData
        self.view?.reloadData()
    }
}
