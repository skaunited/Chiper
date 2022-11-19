//
//  ThemedActivityIndicatorView.swift
//  Chiper
//
//  Created by Skander Bahri on 19/11/2022.
//

import UIKit

protocol ThemedActivityIndicatorViewProtocol {
    func renderIndicatorView() -> UIActivityIndicatorView
}

class ThemedActivityIndicatorView: ThemedActivityIndicatorViewProtocol {
    public static let shared = ThemedActivityIndicatorView()
    
    func renderIndicatorView() -> UIActivityIndicatorView {
        UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
    }
}
