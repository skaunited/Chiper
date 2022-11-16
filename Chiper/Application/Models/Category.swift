//
//  Category.swift
//  Chiper
//
//  Created by Skander Bahri on 16/11/2022.
//

import Foundation

public struct Category: Decodable, Equatable {
    public let id: Int
    public let name: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
    }
}
