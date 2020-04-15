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

struct Latlng {
    var lat: Double
    var lng: Double
    
    init(lat: Double, lng: Double) {
        self.lat = lat
        self.lng = lng
    }
    
    var convertString: String { return "\(lng),\(lat)" }
}
