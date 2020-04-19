//
//  NMapsViewModel.swift
//  ARPlace
//
//  Created by youngjun goo on 2020/04/17.
//  Copyright © 2020 youngjun goo. All rights reserved.
//

import Foundation
import Combine
import NMapsMap

final class NMapsViewModel: ObservableObject {
    // [Test]
    @Published var latitude: Double = 0
    @Published var longitude: Double = 0
    
    private let locationManager: LocationManager
    
    init(locationManager: LocationManager = LocationManagerImpl()) {
        self.locationManager = locationManager
    }
}
