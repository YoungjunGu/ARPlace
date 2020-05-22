//
//  SearchPlaceCell.swift
//  ARPlace
//
//  Created by youngjun goo on 2020/05/22.
//  Copyright © 2020 youngjun goo. All rights reserved.
//

import SwiftUI

struct SearchPlaceCell: View {
    var place: PlaceInfo
    
    init(place: PlaceInfo) {
        self.place = place
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(place.name ?? "")")
                Text("\(place.roadAddress ?? "")")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
    }
}
