//
//  NetworkManager.swift
//  ARPlace
//
//  Created by youngjun goo on 2020/04/24.
//  Copyright © 2020 youngjun goo. All rights reserved.
//

import Combine
import Foundation

typealias Response = (data: Data, response: URLResponse)

protocol NetworkManager {
    func request(_ target: TargetType) -> AnyPublisher<Response, NetworkError>
}

final class NetworkManagerImpl: NetworkManager {
    func request(_ target: TargetType) -> AnyPublisher<Response, NetworkError> {
        let components = createURLComponents(target)
        guard let url = components.url else {
            return Empty().eraseToAnyPublisher()
        }
        var request = URLRequest(url: url, timeoutInterval: 1)
        request.httpMethod = target.method.rawValue
        request.httpBody = target.body
        
        let (clientId, clientSecret) = apiKey()
        request.setValue(clientId, forHTTPHeaderField: NaverSearchAPI.NSLClientIdHeader.rawValue)
        request.setValue(clientSecret, forHTTPHeaderField: NaverSearchAPI.NSLClientSecretHeader.rawValue)
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                    throw NetworkError.requestFailed
                }
                return (data, response)
        }
        .mapError { error in
            if let error = error as? NetworkError {
                return error
            } else {
                return NetworkError.requestFailed
            }
        }
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
    
    func apiKey() -> (String, String) {
        guard let clientId: String = Bundle.main.object(forInfoDictionaryKey: "NMFClientId") as? String, let clientSecret: String = Bundle.main.object(forInfoDictionaryKey: "NMFClientSecret") as? String else { return ("", "") }
        
        return (clientId, clientSecret)
    }
}
