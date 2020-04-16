//
//  Navigation.swift
//  ARPlace
//
//  Created by youngjun goo on 2020/04/17.
//  Copyright © 2020 youngjun goo. All rights reserved.
//

import Foundation

struct Navigation {
    var locationData: Location?
    var startLocation: Latlng
    var goalLocation: Latlng
    
    init(_ start: Latlng, _ goal: Latlng) {
         self.startLocation = start
         self.goalLocation = goal
     }
}
