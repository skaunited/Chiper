//
//  Drawing.swift
//  Chiper
//
//  Created by Skander Bahri on 15/11/2022.
//

import UIKit

protocol DrawingProtocol {
    func drawIcon(ressourceName: String?, systemName: String?, size: CGFloat?, isSFSymbol: Bool) -> UIImage
}

class Drawing: DrawingProtocol {
    public static let shared = Drawing()
    
    internal func drawIcon(ressourceName: String?, systemName: String?, size: CGFloat?, isSFSymbol: Bool) -> UIImage {
        let largeFont = UIFont.systemFont(ofSize: size.orDefault)
        let configuration = UIImage.SymbolConfiguration(font: largeFont)
        var image: UIImage?
        image = isSFSymbol ? UIImage(systemName: systemName.orEmpty, withConfiguration: configuration) : UIImage(named: ressourceName.orEmpty)
        
        
        return image.orDefault
    }
}
