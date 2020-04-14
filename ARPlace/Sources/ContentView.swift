//
//  ContentView.swift
//  ARPlace
//
//  Created by youngjun goo on 2020/04/13.
//  Copyright © 2020 youngjun goo. All rights reserved.
//

import SwiftUI
import NMapsMap

struct NaverMapView: UIViewRepresentable {
    
    var locationManager = CLLocationManager()
    
    func setUpManager() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
    }
    
    func makeUIView(context: Context) -> NMFNaverMapView {
        setUpManager()
        let naverMapView = NMFNaverMapView()
        naverMapView.positionMode = .disabled
        naverMapView.mapView.zoomLevel = 15
        naverMapView.showLocationButton = false
        naverMapView.showIndoorLevelPicker = true
        return naverMapView
    }
    
    func updateUIView(_ uiView: NMFNaverMapView, context: Context) {
    }
}

struct ContentView: View {
    var body: some View {
        NaverMapView()
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
