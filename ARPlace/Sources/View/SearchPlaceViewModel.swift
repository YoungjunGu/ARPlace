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
    private let searchText: String = ""
    private let _searchWithQuery = PassthroughSubject<String, Never>()
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Subjects
    
    private let isPresentedSubject = CurrentValueSubject<Void?, Never>(nil)
    private let isLoadingSubject = CurrentValueSubject<(Bool, Bool)?, Never>(nil)
    
    // MARK: - Outputs
    
    @Published private(set) var placeInfo: [PlaceInfo] = []
    @Published private(set) var errorMessage: String? = nil
    @Published private(set) var isLoading = false
    
    
    init(apiService: APIService = APIServiceImpl()) {
        self.apiService = apiService
        
        let searchTrigger = _searchWithQuery
            .compactMap { $0 }
            .debounce(for: .milliseconds(300), scheduler: DispatchQueue.main)
            .removeDuplicates()
        
        searchTrigger
            .map { _ in true }
            .assign(to: \.isLoading, on: self)
            .store(in: &cancellables)
        
        let response = searchTrigger
            .flatMap { (query) -> AnyPublisher<[PlaceInfo], Never> in
                // [TEST]
                print("searchString:",query)
                return apiService.searchPlaces(input: query)
        }
        
        
    }
    
}
