//
//  Network.swift
//  Chiper
//
//  Created by Skander Bahri on 16/11/2022.
//

import Foundation
import Combine

enum Error: Swift.Error {
    case network
}

struct Network {
    static let shared = Network()

    func fetchData<T: Decodable>(for router: WebServiceProviderRouter, defaultValue: T) -> AnyPublisher<Result<T, Error>, Never> {
        let decoder = JSONDecoder()
        
        return URLSession.shared
            .dataTaskPublisher(for: router.url)
            .retry(1)
            .map(\.data)
            .decode(type: T.self, decoder: decoder)
            .receive(on: DispatchQueue.main)
            .map { .success($0)  }
            .catch { (error) -> AnyPublisher<Result<T, Error>, Never> in
                return Just(.failure(.network)).eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
}
