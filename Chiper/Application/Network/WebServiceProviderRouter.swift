//
//  WebServiceProviderRouter.swift
//  Chiper
//
//  Created by Skander Bahri on 16/11/2022.
//

import Foundation
import Network

public enum WebServiceProviderRouter {
    case getListing
    case categories
    
    public var method: String {
        "GET"
    }
    
    public var url: URL {
        switch self {
        case .getListing:
            return URL(fileURLWithPath: Constants.BASE_URL + "listing.json")
        case .categories:
            return URL(fileURLWithPath: Constants.BASE_URL + "categories.json")
        }
    }
}
