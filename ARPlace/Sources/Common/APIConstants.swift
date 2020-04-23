//
//  APIConstants.swift
//  ARPlace
//
//  Created by youngjun goo on 2020/04/16.
//  Copyright © 2020 youngjun goo. All rights reserved.
//

import Foundation

public enum NaverSearchAPI: String {
    case scheme = "https"
    case host = "naveropenapi.apigw.ntruss.com"
    case path = "/map-place/v1/search"
    // Naver Search
    case NSLbaseURL = "https://naveropenapi.apigw.ntruss.com/map-place/v1/search"
    case NSLClientIdHeader = "X-NCP-APIGW-API-KEY-ID"
    case NSLClientSecretHeader = "X-NCP-APIGW-API-KEY"
}

public enum NaverDirectionAPI: String {
    case scheme = "https"
    case host = "naveropenapi.apigw.ntruss.com"
    case path = "map-direction/v1/driving"
    // Naver Driving
    case NMFClientId = "NMFClientId"
    case NMFClientSecret = "NMFClientSecret"
    case NMbaseURL = "https://naveropenapi.apigw.ntruss.com/map-direction/v1/driving"
    case NMClientIdHeader = "X-NCP-APIGW-API-KEY-ID"
    case NMClientSecretHeader = "X-NCP-APIGW-API-KEY"
    case trafast = "trafast"
}


