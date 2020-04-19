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
    
    func updateUIView(_ view: NMFNaverMapView, context: Context) {
        view.delegate = context.coordinator
    }
    
    func makeCoordinator() -> NMapsViewCoordinator {
        NMapsViewCoordinator(self)
    }
}

struct NaverMapView_Previews: PreviewProvider {
    static var previews: some View {
        NaverMapView()
    }
}
