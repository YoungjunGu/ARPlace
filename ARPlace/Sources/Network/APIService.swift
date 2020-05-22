//
//  APIService.swift
//  ARPlace
//
//  Created by youngjun goo on 2020/04/24.
//  Copyright © 2020 youngjun goo. All rights reserved.
//

import Combine
import Foundation

protocol APIService {
    func searchPlaces(input: PlaceInput) -> AnyPublisher<[PlaceInfo], Error>
}

final class APIServiceImpl: APIService {
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager = NetworkManagerImpl()) {
        self.networkManager = networkManager
    }
    
    func searchPlaces(input: PlaceInput) -> AnyPublisher<[PlaceInfo], Error> {
        Just(input)
            .map { SearchAPITarget(parameter: ["query": $0.query,
                                               "coordinate": $0.coordinate.convertString]) }
            .setFailureType(to: NetworkError.self)
            .flatMap(networkManager.request(_:))
            .map(\.data)
            .decode(type: [PlaceInfo].self, decoder: JSONDecoder())
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
        
    }
}
