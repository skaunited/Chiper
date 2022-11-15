//
//  ThemedTableView.swift
//  Chiper
//
//  Created by Skander Bahri on 15/11/2022.
//

import UIKit

protocol ThemedTableViewProtocol {
    func renderTableView(translatesAutoresizingMaskIntoConstraints: Bool) -> UITableView
}

class ThemedTableView: UITableView, ThemedTableViewProtocol {
    public static let shared = ThemedTableView()
    
    func renderTableView(translatesAutoresizingMaskIntoConstraints: Bool) -> UITableView {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        return tableView
    }
}
