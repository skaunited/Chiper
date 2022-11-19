//
//  HomeProtocol.swift
//  Chiper
//
//  Created by Skander Bahri on 13/11/2022.
//

import Foundation

protocol HomeViewProtocol {
    func reloadData()
}

protocol HomePresenterProtocol: TableViewPresenter {
    func willShow(cell: ItemTableViewCellProtocol, indexPath: IndexPath)
    func getCategories() -> [Category]
    func setFilter(by category: Category?)
}
