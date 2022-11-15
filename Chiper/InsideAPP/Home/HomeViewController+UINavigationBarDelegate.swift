//
//  HomeViewController+UINavigationBarDelegate.swift
//  Chiper
//
//  Created by Skander Bahri on 14/11/2022.
//

import UIKit

extension HomeViewController: UINavigationBarDelegate {
    func position(for bar: UIBarPositioning) -> UIBarPosition {
     return .topAttached
    }
}
