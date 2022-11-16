//
//  HomeManager.swift
//  Chiper
//
//  Created by Skander Bahri on 16/11/2022.
//

import Foundation
import Combine

protocol HomeManagerProtocol {
    func getListingData(completion: @escaping (ListingData?) -> Void)
}

class HomeManager: HomeManagerProtocol {
    public static let shared = HomeManager()
    lazy var webServiceProviderManager: WebServiceProviderManagerProtocol = WebServiceProviderManager.shared
    
    func getListingData(completion: @escaping (ListingData?) -> Void) {
        webServiceProviderManager.getAdsData { listingData in
            completion(listingData)
        }
    }
}

