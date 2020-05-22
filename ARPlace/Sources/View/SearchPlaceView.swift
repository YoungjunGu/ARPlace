//
//  SearchPlaceView.swift
//  ARPlace
//
//  Created by youngjun goo on 2020/04/20.
//  Copyright © 2020 youngjun goo. All rights reserved.
//

import SwiftUI

struct SearchPlaceView: View {
    @ObservedObject private var viewModel = SearchPlaceViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                SearchPlaceBar(searchText: $viewModel.searchText)
                List(viewModel.items, id: \.id) { item in
                    NavigationLink(destination: PlaceDetailView()) {
                        SearchPlaceCell(place: item)
                    }
                }
            }
            .navigationBarTitle(Text("Search Place"))
        }
    }
}

struct SearchPlaceView_Previews: PreviewProvider {
    static var previews: some View {
        SearchPlaceView()
    }
}


