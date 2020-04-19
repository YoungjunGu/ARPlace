//
//  NaverMapView.swift
//  ARPlace
//
//  Created by youngjun goo on 2020/04/15.
//  Copyright © 2020 youngjun goo. All rights reserved.
//

import SwiftUI
import NMapsMap

struct NaverMapView: UIViewRepresentable {
    
    @ObservedObject var viewModel = NMapsViewModel()
    
    func makeUIView(context: Context) -> NMFNaverMapView {
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
