//
//  Image.swift
//  Chiper
//
//  Created by Skander Bahri on 16/11/2022.
//

import Foundation

struct Image: Codable, Equatable {
    let small, thumb: String?
    
    static func == (lhs: Image, rhs: Image) -> Bool {
        return lhs.small == rhs.small &&
        lhs.thumb == rhs.thumb
    }
}
