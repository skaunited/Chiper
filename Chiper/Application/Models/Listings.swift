//
//  Listings.swift
//  Chiper
//
//  Created by Skander Bahri on 16/11/2022.
//

import Foundation

typealias Listings = [Listing]

// MARK: - listing
struct Listing: Decodable, Equatable {
    let listingId, categoryId, price: Int?
    let title, date, description: String?
    let image: Image?
    let isUrgent: Bool?

    enum CodingKeys: String, CodingKey {
        case listingId = "id"
        case categoryId = "category_id"
        case image = "images_url"
        case price
        case description
        case date = "creation_date"
        case isUrgent = "is_urgent"
        case title
     }
    
    static func == (lhs: Listing, rhs: Listing) -> Bool {
        return lhs.listingId == rhs.listingId &&
        lhs.categoryId == rhs.categoryId &&
        lhs.price == rhs.price &&
        lhs.title == rhs.title &&
        lhs.date == rhs.date &&
        lhs.description == rhs.description &&
        lhs.image == rhs.image &&
        lhs.isUrgent == rhs.isUrgent
    }
}

extension Listing {
    func asEntity(categories: [Category]) -> ListingEntity {
        var url: URL?
        if let imageString = image?.small {
            url = URL(string: imageString)
        }
        let categorie = categories.first(where: { $0.id == categoryId ?? 0})
        
        return ListingEntity(image: url,
                             name: title,
                             date: date,
                             description: description,
                             price: price,
                             isUrgent: isUrgent,
                             category: categorie)
    }
}

extension Listings {
    func asEntities(categories: [Category]) -> ListingEntities {
        self.map { $0.asEntity(categories: categories) }
    }
}

