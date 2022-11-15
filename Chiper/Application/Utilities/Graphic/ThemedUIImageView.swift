//
//  ThemedUIImage.swift
//  Chiper
//
//  Created by Skander Bahri on 15/11/2022.
//

import Foundation
import UIKit

protocol ThemedUIImageViewProtocol {
    func renderUIImageView(systemName: String?,
                           contentMode: UIView.ContentMode,
                           size: CGFloat,
                           cornerRadius: CGFloat,
                           clipsToBounds: Bool,
                           isSFSymbol: Bool,
                           autoresizing: Bool) -> UIImageView
    
    func renderUIImageView(ressourceName: String?,
                           contentMode: UIView.ContentMode,
                           size: CGFloat,
                           cornerRadius: CGFloat,
                           clipsToBounds: Bool,
                           isSFSymbol: Bool,
                           autoresizing: Bool) -> UIImageView
    
    func clean(imageView: UIImageView, size: CGFloat) -> UIImageView
}

class ThemedUIImageView: UIImageView, ThemedUIImageViewProtocol {
    lazy var drawer: DrawingProtocol = Drawing.shared
    public static let shared = ThemedUIImageView()
    
    func renderUIImageView(systemName: String?,
                           contentMode: UIView.ContentMode,
                           size: CGFloat,
                           cornerRadius: CGFloat,
                           clipsToBounds: Bool,
                           isSFSymbol: Bool,
                           autoresizing: Bool) -> UIImageView {
        let imageView = initializeImageView(contentMode: contentMode,
                                            cornerRadius: cornerRadius,
                                            clipsToBounds: clipsToBounds,
                                            autoresizing: autoresizing)
        
        imageView.image = drawer.drawIcon(ressourceName: nil,
                                          systemName: systemName,
                                          size: size,
                                          isSFSymbol: isSFSymbol)
        
        return imageView
    }
    
    func renderUIImageView(ressourceName: String?,
                           contentMode: UIView.ContentMode,
                           size: CGFloat,
                           cornerRadius: CGFloat,
                           clipsToBounds: Bool,
                           isSFSymbol: Bool,
                           autoresizing: Bool) -> UIImageView {
        let imageView = initializeImageView(contentMode: contentMode,
                                            cornerRadius: cornerRadius,
                                            clipsToBounds: clipsToBounds,
                                            autoresizing: autoresizing)
        
        imageView.image = drawer.drawIcon(ressourceName: ressourceName,
                                          systemName: nil,
                                          size: size,
                                          isSFSymbol: isSFSymbol)
        
        return imageView
    }
    
    func clean(imageView: UIImageView, size: CGFloat) -> UIImageView {
        imageView.image = drawer.drawIcon(ressourceName: nil,
                                          systemName: Constants.placeHolderIcon,
                                          size: size,
                                          isSFSymbol: true)
        return imageView
    }
}

private extension ThemedUIImageView {
    func initializeImageView(contentMode: UIView.ContentMode,
                             cornerRadius: CGFloat,
                             clipsToBounds: Bool,
                             autoresizing: Bool) -> UIImageView {
        let imageView = UIImageView()
        imageView.clipsToBounds = clipsToBounds
        imageView.layer.cornerRadius = cornerRadius
        imageView.translatesAutoresizingMaskIntoConstraints = autoresizing
        imageView.contentMode = contentMode
        
        return imageView
    }
}
