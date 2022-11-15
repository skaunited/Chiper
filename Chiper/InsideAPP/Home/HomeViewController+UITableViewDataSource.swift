//
//  HomeViewController+UITableViewDataSource.swift
//  Chiper
//
//  Created by Skander Bahri on 14/11/2022.
//

import UIKit

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.numberOfRows(inSection: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ItemTableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier,
                                                                          for: indexPath) as? ItemTableViewCell else { return UITableViewCell() }
        
        presenter?.willShow(cell: cell, indexPath: indexPath)
        return cell
    }
}
