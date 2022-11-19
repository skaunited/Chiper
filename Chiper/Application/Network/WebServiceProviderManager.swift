//
//  WebServiceProviderManager.swift
//  Chiper
//
//  Created by Skander Bahri on 16/11/2022.
//

import Foundation
import Combine

typealias ListingData = (listing: ListingEntities, categories: [Category])

protocol WebServiceProviderManagerProtocol {
    func getAdsData(completion: @escaping (ListingData?) -> Void)
}

class WebServiceProviderManager: WebServiceProviderManagerProtocol {
    public static let shared = WebServiceProviderManager()
    
    private var requests = Set<AnyCancellable>()
    private let categoryTask = Network.shared.fetchData(for: .categories, defaultValue: GenericListResponse<Category>())
    private let listingTask = Network.shared.fetchData(for: .getListing, defaultValue: GenericListResponse<Listing>())
    
    func getAdsData(completion: @escaping (ListingData?) -> Void) {
        let zipped = Publishers.Zip(categoryTask, listingTask)
        zipped
            .sink { fetchedCategorys, fetchedListing in
                switch (fetchedCategorys, fetchedListing ){
                case (.success(let categories), .success(let listing)):
                    let listingsEntities = listing.list.asEntities(categories: categories.list)
                    let categoriesList = categories.list
                    completion((listing: listingsEntities, categories: categoriesList))
                default:
                    completion(nil)
                }
            }
            .store(in: &requests)
    }
}
