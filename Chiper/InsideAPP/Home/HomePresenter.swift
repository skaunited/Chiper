//
//  HomeViewPresenter.swift
//  Chiper
//
//  Created by Skander Bahri on 13/11/2022.
//

import Foundation

class HomePresenter {
    var view: HomeViewProtocol?
    
    internal init(view: HomeViewProtocol? = nil) {
        self.view = view
    }
}

extension HomePresenter: HomePresenterProtocol {
    
}
