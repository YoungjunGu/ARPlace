//
//  ContentView.swift
//  ARPlace
//
//  Created by youngjun goo on 2020/04/13.
//  Copyright © 2020 youngjun goo. All rights reserved.
//
import SwiftUI

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
