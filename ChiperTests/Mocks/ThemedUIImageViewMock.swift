//
//  ThemedUIImageViewMock.swift
//  ChiperTests
//
//  Created by Skander Bahri on 19/11/2022.
//

import XCTest

@testable import Chiper

class ThemedUIImageViewMock {
    var renderUIImageViewCallStatus = CallStatus<(String?, UIView.ContentMode, CGFloat, CGFloat, Bool, Bool, Bool)>.none
    var renderUIImageViewForRessourceCallStatus = CallStatus<(String?, UIView.ContentMode, CGFloat, CGFloat, Bool, Bool, Bool)>.none
    var cleanCallStatus = CallStatus<(UIImageView, CGFloat)>.none
}

extension ThemedUIImageViewMock: ThemedUIImageViewProtocol {
    func renderUIImageView(systemName: String?, contentMode: UIView.ContentMode, size: CGFloat, cornerRadius: CGFloat, clipsToBounds: Bool, isSFSymbol: Bool, autoresizing: Bool) -> UIImageView {
        renderUIImageViewCallStatus.iterate(with: (systemName,
                                                   contentMode,
                                                   size,
                                                   cornerRadius,
                                                   clipsToBounds,
                                                   isSFSymbol,
                                                   autoresizing))
        return UIImageView()
    }
    
    func renderUIImageView(ressourceName: String?, contentMode: UIView.ContentMode, size: CGFloat, cornerRadius: CGFloat, clipsToBounds: Bool, isSFSymbol: Bool, autoresizing: Bool) -> UIImageView {
        renderUIImageViewForRessourceCallStatus.iterate(with: (ressourceName,
                                                               contentMode,
                                                               size,
                                                               cornerRadius,
                                                               clipsToBounds,
                                                               isSFSymbol,
                                                               autoresizing))
        return UIImageView()
    }
    
    func clean(imageView: UIImageView, size: CGFloat) -> UIImageView {
        cleanCallStatus.iterate(with: (imageView, size))
        return UIImageView()
    }
}
