//
//  LocationManager.swift
//  ARPlace
//
//  Created by youngjun goo on 2020/04/17.
//  Copyright © 2020 youngjun goo. All rights reserved.
//

import Foundation
import Combine
import NMapsMap

protocol LocationManager: class {
    
    var authorizationStatus: CLAuthorizationStatus { get }
    
    var authorizationChangingHandler: ((CLAuthorizationStatus) -> Void)? { get }
    
    var errorHandler: ((Error) -> Void)? { get }
    
    func requestAuthorization()
    
    func startUpdatingLocation()
    
    func stopUpdatingLocation()
}
