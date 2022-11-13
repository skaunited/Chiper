//
//  HomeViewController.swift
//  Chiper
//
//  Created by Skander Bahri on 13/11/2022.
//

import UIKit

class HomeViewController: UIViewController {
    var presenter: HomePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        // Do any additional setup after loading the view.
    }
}

extension HomeViewController: HomeViewProtocol {
    private func addSubview() {
        view.backgroundColor = .red
    }
}

