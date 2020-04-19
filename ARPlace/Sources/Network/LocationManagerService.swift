//
//  LocationManagerService.swift
//  ARPlace
//
//  Created by youngjun goo on 2020/04/17.
//  Copyright © 2020 youngjun goo. All rights reserved.
//

import Foundation
import Combine
import NMapsMap


class LocationManagerImpl: NSObject {
    
    private let locationManager = CLLocationManager()
    
    @Published var currentLocation: CLLocation? {
        willSet {
            objectWillChange.send()
        }
    }
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
    let objectWillChange = PassthroughSubject<Void, Never>()
}

extension LocationManagerImpl: LocationManager, CLLocationManagerDelegate {
    var authorizationStatus: CLAuthorizationStatus {
        return CLLocationManager.authorizationStatus()
    }
    
    var authorizationChangingHandler: ((CLAuthorizationStatus) -> Void)? {
        return { status in
            switch status {
            case .authorizedAlways, .authorizedWhenInUse:
                self.startUpdatingLocation()
            default:
                NotificationCenter.default
                    .post(name: .locationPermissionDenied, object: nil, userInfo: ["status": status])
            }
        }
    }
    
    var errorHandler: ((Error) -> Void)? {
        return { error in
            guard error is CLError else { return }
            NotificationCenter.default
                .post(name: .didFailUpdatingAllLocationTasks,
                      object: nil,
                      userInfo: ["error": GPSError.coreLocationError])
        }
    }
    
    func requestAuthorization() {
        locationManager.requestAlwaysAuthorization()
    }
    
    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }
    
    func stopUpdatingLocation() {
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.currentLocation = location
        // [TEST]
        print(#function, location)
    }
}
