//
//  Data.swift
//  Favoriteplace
//
//  Created by Mustafa Khalil on 8/16/20.
//

import Foundation
import FlatBuffers

final class Store {
    
    var places: Places
    
    static let instance = Store()
    
    private init() {
        guard let file = Bundle.main.url(forResource: "data", withExtension: "mon") else {
            fatalError("Couldnt load data.mon")
        }
        
        guard let data = try? Data(contentsOf: file) else {
            fatalError("Couldnt load data from \(file)")
        }
        places = Places.getRootAsPlaces(bb: ByteBuffer(data: data))
    }
    
    #if DEBUG
    static var getFirstPlace: Place {
        let store = Store.instance
        return store.places.data(at: 0)!
    }
    #endif
}
