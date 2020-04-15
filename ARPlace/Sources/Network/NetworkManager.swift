//
//  NetworkManager.swift
//  ARPlace
//
//  Created by youngjun goo on 2020/04/15.
//  Copyright © 2020 youngjun goo. All rights reserved.
//

import Combine
import Foundation

typealias Response = (data: Data, response: URLResponse)

protocol NetworkManager {
    func request(_ target: TargetType) -> AnyPublisher<Response, Error>
}

final class NetworkManagerImpl: NetworkManager {
    func request(_ target: TargetType) -> AnyPublisher<Response, Error> {
        let components = createURLComponents(target)
        guard let url = components.url else {
            return Empty().eraseToAnyPublisher()
        }
        var request = URLRequest(url: url, timeoutInterval: 1)
        request.httpMethod = target.method.rawValue
        request.httpBody = target.body
        return URLSession.shared.dataTaskPublisher(for: request)
            .retry(1)
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
}

extension NetworkManager {
    func createURLComponents(_ target: TargetType) -> URLComponents {
        var components = URLComponents()
        components.scheme = target.routerVersion.scheme
        components.host = target.routerVersion.host
        components.path = target.paths.map { "/\($0)" }.joined()
        components.queryItems = target.parameter?.map { URLQueryItem(name: $0.key, value: $0.value) }
        
        return components
    }
}
