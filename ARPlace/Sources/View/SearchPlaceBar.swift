//
//  SearchPlaceBar.swift
//  ARPlace
//
//  Created by youngjun goo on 2020/05/23.
//  Copyright © 2020 youngjun goo. All rights reserved.
//

import SwiftUI

struct SearchPlaceBar: View {
    @Binding var searchText: String
    
    var body: some View {
        ZStack {
            Color.green
            HStack {
                TextField("장소, 버스, 지하철, 주소 검색", text: $searchText)
                    .padding([.leading, .trailing], 8)
                    .frame(height: 32)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(9)
            }
            .padding([.leading, .trailing], 16)
        }
        .frame(height: 50)
    }
}

#if DEBUG
struct SearchPlaceBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchPlaceBar(searchText: .constant(""))
            .previewLayout(.fixed(width: 300, height: 60))
    }
}
#endif
