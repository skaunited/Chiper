//
//  UIIImageViewExtension.swift
//  Chiper
//
//  Created by Skander Bahri on 19/11/2022.
//

import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global(qos: .background).async {
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            }
        }
    }
}
