//
//  listingEntity.swift
//  Chiper
//
//  Created by Skander Bahri on 16/11/2022.
//

import Foundation

typealias ListingEntities = [ListingEntity]

struct ListingEntity {
    let image: String?
    let title: String?
    let date: String?
    let description: String?
    let price: Int?
    let isUrgent: Bool?
    let category: Category?
}
