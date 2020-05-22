//
//  SearchPlaceViewModel.swift
//  ARPlace
//
//  Created by youngjun goo on 2020/04/20.
//  Copyright © 2020 youngjun goo. All rights reserved.
//

import SwiftUI
import Combine

final class SearchPlaceViewModel: ObservableObject {
    private let apiService: APIService
    @Published var searchText: String = ""
    @Published private(set) var items = [PlaceInfo]()
    
    private var searchCancellable: Cancellable? {
        didSet {
            oldValue?.cancel()
        }
    }
    
    deinit {
        searchCancellable?.cancel()
    }
    
    init(apiService: APIService = APIServiceImpl()) {
        self.apiService = apiService
        
        searchCancellable = $searchText
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .removeDuplicates()
            .filter { $0.isEmpty && $0.first != " " }
            .flatMap { (query) -> AnyPublisher<[PlaceInfo], Never> in
                print("query:",query)
                // 임시: 좌표값을 어떻게 해줄지 생각(view <-> viewModel 사이)
                // 그팩 좌표    37.35934285278361, 127.104972677232
                let input = PlaceInput(query: "그린팩토리", coordinate: Latlng(lat: 37.35934285278361, lng: 127.104972677232))
                return apiService.searchPlaces(input: input)
                    .replaceError(with: []) // 우선은 []로 핸들링
                    .eraseToAnyPublisher()
        }
        .replaceError(with: [])
        .assign(to: \.items, on: self)
    }
}
