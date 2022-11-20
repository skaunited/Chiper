//
//  HomeViewController+UITableViewDelegate.swift
//  Chiper
//
//  Created by Skander Bahri on 14/11/2022.
//

import UIKit

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        presenter?.shouldHighlightRow(at: indexPath) ?? false
    }
}


