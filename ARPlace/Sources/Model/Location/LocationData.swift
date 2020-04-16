//
//  LocationData.swift
//  ARPlace
//
//  Created by youngjun goo on 2020/04/15.
//  Copyright © 2020 youngjun goo. All rights reserved.
//

import Foundation
import NMapsMap

struct LocationData {
    var locationName: String
    /*
     NMGLatLng을 사용하셨는데요, 이는 Naver Map SDK와의 디펜던시를 높이는 결과를 가져옵니다.
     혹시 카카오도 지도 SDK를 제공하는지 모르겠지만, 카카오나 애플지도를 사용하게 바꾸게 된다면 수정을 많이 해줘야 합니다.
     이런 경우 외부 모듈과의 의존성을 제거하는 방법을 조금 더 고민해보면 좋을 것 같아요.
     */
    var curLocation: NMGLatLng
}

struct NavigationData {
    var locationData: LocationData?
    var startLocation: NMGLatLng
    var goalLocation: NMGLatLng
    
    init(_ start: NMGLatLng, _ goal: NMGLatLng) {
         self.startLocation = start
         self.goalLocation = goal
     }
}

/*
 두개의 struct에 Data라는 모호한 표현이 사용되었는데요, data, info, item 같은 모호한 단어들은 최대한 사용하지 않는 것이 좋아요.
 (뭐 경우에 따라서는 도저히 다른 type과의 이름 충돌을 피할 수 없어서 사용하는 경우도 있지만)
*/

struct Latlng {
    var lat: Double
    var lng: Double
    
    init(lat: Double, lng: Double) {
        self.lat = lat
        self.lng = lng
    }
    
    var convertString: String { return "\(lng),\(lat)" }
}
