//
//  GridViewModel.swift
//  Favoriteplace
//
//  Created by Mustafa Khalil on 8/17/20.
//

import SwiftUI

class GridViewModel: ObservableObject {
    var count: Int
    let places: Places
    
    init() {
        places = Store.instance.places
        count = Int(places.dataCount)
    }
    
    func getPlace(at index: Int) -> Place {
        return places.data(at: Int32(index))!
    }
}
