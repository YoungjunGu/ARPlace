//
//  TargetVersion.swift
//  ARPlace
//
//  Created by youngjun goo on 2020/04/16.
//  Copyright © 2020 youngjun goo. All rights reserved.
//

import Foundation

enum TargetVersion {
    case directionAPI
    case searchAPI
}

extension TargetVersion {
    var scheme: String {
        switch self {
        case .directionAPI:
            return NaverDirectionAPI.scheme.rawValue
        case .searchAPI:
            return NaverSearchAPI.scheme.rawValue
        }
    }
    
    var host: String {
        switch self {
        case .directionAPI:
            return NaverDirectionAPI.host.rawValue
        case .searchAPI:
            return NaverSearchAPI.host.rawValue
        }
    }
}
