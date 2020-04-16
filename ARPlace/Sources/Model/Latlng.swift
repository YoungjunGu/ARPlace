//
//  Latlng.swift
//  ARPlace
//
//  Created by youngjun goo on 2020/04/17.
//  Copyright © 2020 youngjun goo. All rights reserved.
//

import Foundation

struct Latlng {
    var lat: Double
    var lng: Double
    
    init(lat: Double, lng: Double) {
        self.lat = lat
        self.lng = lng
    }
    
    var convertString: String { return "\(lng),\(lat)" }
}
