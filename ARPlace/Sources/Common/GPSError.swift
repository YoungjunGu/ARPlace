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

