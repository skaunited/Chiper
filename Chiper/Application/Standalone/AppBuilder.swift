//
//  AppBuilder.swift
//  Chiper
//
//  Created by Skander Bahri on 13/11/2022.
//

import Foundation

class AppBuiler{
    class func build(for homeView: HomeViewController) -> HomeViewController {
        homeView.presenter = HomePresenter(view: homeView)
        return homeView
    }
}
