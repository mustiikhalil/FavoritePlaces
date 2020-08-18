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
    
    func replaceBinary() {
        var newBuilder = FlatBufferBuilder()
        var offsets: [Offset<UOffset>] = []

        for i in 0..<places.dataCount {
            let current = places.data(at: i)!
            let name = newBuilder.createShared(string: current.name)
            let park = newBuilder.createShared(string: current.park)
            let state = newBuilder.createShared(string: current.state)
            let city = newBuilder.createShared(string: current.city)
            let imageName = newBuilder.createShared(string: current.imageName)
            let coords = current.coordinates!

            let offset = Place.createPlace(&newBuilder,
                                           id: current.id,
                                           offsetOfName: name,
                                           offsetOfPark: park,
                                           structOfCoordinates: Coordinates.createCoordinates(longitude: coords.longitude, latitude: coords.latitude),
                                           offsetOfState: state,
                                           offsetOfCity: city,
                                           category: current.category,
                                           offsetOfImageName: imageName,
                                           isFavorite: false)
            offsets.append(offset)
        }
        let array = newBuilder.createVector(ofOffsets: offsets)
        let root = Places.createPlaces(&newBuilder, vectorOfData: array)
        newBuilder.finish(offset: root)
        let data = newBuilder.data
        replaceStore(data: data)
    }
    
    func replaceStore(data: Data) {
        var url = Bundle.main.resourceURL!
        url.appendPathComponent("data.mon")
        
        do {
            try FileManager.default.removeItem(at: url)
        } catch {
            print(error)
        }
        try! data.write(to: url)
    }
    
    #if DEBUG
    static var getFirstPlace: Place {
        let store = Store.instance
        return store.places.data(at: 0)!
    }
    #endif
}
