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
            self.view?.reloadData()
        })
    }
    
    func willShow(cell: ItemTableViewCellProtocol, indexPath: IndexPath) {
        guard let item = listingData?.listing.getOrNull(indexPath.row) else { return }
        let model = ItemTableViewCellModel(titleLabel: <#T##String#>,
                                           description: <#T##String#>,
                                           price: <#T##String#>,
                                           categoryLabel: <#T##String#>,
                                           itemImage: <#T##UIImage#>,
                                           creationDate: <#T##Date#>,
                                           isUrgent: <#T##Bool#>)
        cell.configure(with: itemModel)
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
    
    func mock() {
        let model = ItemTableViewCellModel(titleLabel: "Statue homme noir assis en plâtre polychrome",
                                       description: "Magnifique Statuette homme noir assis fumant le cigare en terre cuite et plâtre polychrome réalisée à la main.  Poids  1,900 kg en très bon état, aucun éclat  !  Hauteur 18 cm  Largeur : 16 cm Profondeur : 18cm  Création Jacky SAMSON  OPTIMUM  PARIS  Possibilité de remise sur place en gare de Fontainebleau ou Paris gare de Lyon, en espèces (heure et jour du rendez-vous au choix). Envoi possible ! Si cet article est toujours visible sur le site c'est qu'il est encore disponible",
                                       price: "\(140.00)€",
                                       categoryLabel: "Multimédia",
                                       itemImage: themedImageView.renderUIImageView(ressourceName: "listedItem",
                                                                                    contentMode: .scaleAspectFill,
                                                                                    size: 50,
                                                                                    cornerRadius: 5,
                                                                                    clipsToBounds: true,
                                                                                    isSFSymbol: false,
                                                                                    autoresizing: false).image.orDefault,
                                       creationDate: Date(),
                                       isUrgent: true)
        
        tableViewArray.append(model)
        tableViewArray.append(model)
        tableViewArray.append(model)
        tableViewArray.append(model)
    }
}
