//
//  HomeViewController+HomeViewProtocol.swift
//  Chiper
//
//  Created by Skander Bahri on 14/11/2022.
//

import Foundation

extension HomeViewController: HomeViewProtocol {
    func reloadData() {
        tableView?.reloadData()
        activityIndicator?.stopAnimating()
    }
}
