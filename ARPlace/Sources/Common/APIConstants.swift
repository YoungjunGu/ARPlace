//
//  APIConstants.swift
//  ARPlace
//
//  Created by youngjun goo on 2020/04/16.
//  Copyright © 2020 youngjun goo. All rights reserved.
//

import Foundation

/*
 function이나 stored property가 없이 grouping의 목적으로만 사용한다면 struct보다 enum이 더 선호됩니다.
 */
public struct NaverSearchAPI {
    static let scheme: String = "https"
    static let host: String = "naveropenapi.apigw.ntruss.com"
    static let path = "/map-place/v1/search"
    // Naver Search
    /*
     URL type이 아니면 property name에 URL이라고 쓰는 것은 혼란을 주기 쉬워요.
     URL type으로 바꾸거나 property name을 변경하는 것이 더 좋지 않을까 싶네요
     */
    static let NSLbaseURL: String = "https://naveropenapi.apigw.ntruss.com/map-place/v1/search"
    static let NSLClientIdHeader: String = "X-NCP-APIGW-API-KEY-ID"
    static let NSLClientSecretHeader: String = "X-NCP-APIGW-API-KEY"
}

public struct NaverDirectionAPI {
    static let scheme: String = "https"
    static let host: String = "naveropenapi.apigw.ntruss.com"
    static let path: String = "map-direction/v1/driving"
    // Naver Driving
    static let NMFClientId: String = "NMFClientId"
    static let NMFClientSecret: String = "NMFClientSecret"
    static let NMbaseURL: String = "https://naveropenapi.apigw.ntruss.com/map-direction/v1/driving"
    static let NMClientIdHeader: String = "X-NCP-APIGW-API-KEY-ID"
    static let NMClientSecretHeader: String = "X-NCP-APIGW-API-KEY"
    static let trafast: String = "trafast"
}


