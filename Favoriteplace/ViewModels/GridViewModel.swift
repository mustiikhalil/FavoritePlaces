//
//  GridViewModel.swift
//  Favoriteplace
//
//  Created by Mustafa Khalil on 8/17/20.
//

import SwiftUI
import Combine

class GridViewModel: ObservableObject {
    
    let objectWillChange = ObservableObjectPublisher()
    @Published var showFavoritesOnly = false
    
    // This is not the best approach since swift wont really know which buffer is the original one and which is the old one...
    var places: Places!
    var count: Int { return Int(places.dataCount) }
    
    var cancellables: AnyCancellable?
    
    init() {
        fetchData()
    }
    
    deinit {
        cancellables = nil
    }
    
    func fetchData() {
        cancellables = Store
            .instance
            .fetchPlaces()
            .sink(receiveValue: { [weak self] places in
                self?.places = places
            })
    }
    
    func isFavorite(_ isFavorite: Bool, at index: Int) {
        objectWillChange.send()
        places.data(at: Int32(index))?.mutate(isFavorite: isFavorite)
    }
    
    func getPlace(at index: Int) -> Place {
        return places.data(at: Int32(index))!
    }
}
