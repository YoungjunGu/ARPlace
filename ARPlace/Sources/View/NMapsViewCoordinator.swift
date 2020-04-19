//
//  NMapsViewCoordinator.swift
//  ARPlace
//
//  Created by youngjun goo on 2020/04/20.
//  Copyright © 2020 youngjun goo. All rights reserved.
//

import Foundation
import NMapsMap

class NMapsViewCoordinator: NSObject, NMFMapViewDelegate {
    var naverMapView: NaverMapView
    
    init(_ control: NaverMapView) {
        self.naverMapView = control
    }
    
    func didTapMapView(_ point: CGPoint, latLng latlng: NMGLatLng) {
        print(latlng)
    }
}
