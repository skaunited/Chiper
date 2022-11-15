//
//  HomeViewPresenter.swift
//  Chiper
//
//  Created by Skander Bahri on 13/11/2022.
//

import Foundation

class HomePresenter {
    var view: HomeViewProtocol?
    var tableViewArray: [ItemTableViewCellModel] = []
    lazy var themedImageView: ThemedUIImageViewProtocol = ThemedUIImageView.shared
    
    init(view: HomeViewProtocol? = nil) {
        self.view = view
    }
}

extension HomePresenter: HomePresenterProtocol {
    func didLoad() {
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
    
    func willShow(cell: ItemTableViewCellProtocol, indexPath: IndexPath) {
        guard let itemModel = tableViewArray.getOrNull(indexPath.row) else { return }
        cell.configure(with: itemModel)
    }
    
    func numberOfRows(inSection: Int) -> Int {
        tableViewArray.count
    }
    
    func cellIdentifier(forIndexPath indexPath: IndexPath) -> String? {
        Constants.cellIdentifier
    }
    
    func numberOfSections() -> Int {
        1
    }
    
    func didSelect(at indexPath: IndexPath) {}
}
