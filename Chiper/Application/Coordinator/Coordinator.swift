//
//  Coordinator.swift
//  Chiper
//
//  Created by Skander Bahri on 13/11/2022.
//

import UIKit

public protocol CoordinatorProtocol : AnyObject {
    init(navigationController:UINavigationController)
    func start()
}

class Coordinator: CoordinatorProtocol {
    unowned let rootController:UINavigationController
    
    // initiate navigationController
    required init(navigationController: UINavigationController) {
        self.rootController = navigationController
    }
    
    // start Coordinator
    func start() {
        let homeViewController = AppBuiler.build(for: HomeViewController())
        rootController.isNavigationBarHidden = true
        rootController.setViewControllers([homeViewController], animated: false)
    }
}
