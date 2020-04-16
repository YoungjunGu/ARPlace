//
//  GPSError.swift
//  ARPlace
//
//  Created by youngjun goo on 2020/04/15.
//  Copyright © 2020 youngjun goo. All rights reserved.
//

import Foundation
import CoreLocation

enum GPSError: Error {
    case notDetermined
    case denied
    case restircted
    case coreLocationError
    case ect
}

extension GPSError: LocalizedError {
    /*
     error라는 이름 보다는 string이나 description 정도가 좋을 것 같아요.
     error라고 되어있으면 Error type으로 인지할 가능성이 커요.
     아니면 아래 프로토콜의 errorDescription을 사용해보는것이 더 적합해보이네요

    public protocol LocalizedError : Error {

        /// A localized message describing what error occurred.
        var errorDescription: String? { get }

        /// A localized message describing the reason for the failure.
        var failureReason: String? { get }

        /// A localized message describing how one might recover from the failure.
        var recoverySuggestion: String? { get }

        /// A localized message providing "help" text if the user requests help.
        var helpAnchor: String? { get }
    }
    */
    var error: String? {
        switch self {
        case .notDetermined:
            return NSLocalizedString("GPS 수신동의가 결정되지 않았습니다. 확인해 주세요", comment: "GPSError")
        case .denied, .restircted:
            return NSLocalizedString("위치 서비스를 사용할 수 없습니다. 기기의 '설정 > 개인정보 보호' 에서 위치서비스를 켜주세요", comment: "GPSError")
        case .ect, .coreLocationError:
            return NSLocalizedString("위치 서비스를 사용할 수 없습니다.", comment: "GPSError")
        }
    }
}

