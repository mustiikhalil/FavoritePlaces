//
//  Data.swift
//  Favoriteplace
//
//  Created by Mustafa Khalil on 8/16/20.
//

import Foundation
import FlatBuffers
import Combine

final class Store {
    
    static let instance = Store()

    func fetchPlaces() -> AnyPublisher<Places, Never> {
        return Future { [weak self] promise in
            guard let data = self?.fetchData() else {
                return
            }
            promise(.success(Places.getRootAsPlaces(bb: ByteBuffer(data: data))))
        }.eraseToAnyPublisher()
    }
        
    func replaceStore(data: Data) -> AnyPublisher<Bool, Error> {
        return Future { promise in
            var url = Bundle.main.resourceURL!
            url.appendPathComponent("data.mon")
            
            do {
                try FileManager.default.removeItem(at: url)
            } catch {
                print(error)
            }
            try! data.write(to: url)
            print("url: \(url)")
            promise(.success(true))
        }.eraseToAnyPublisher()
    }
    
    private func replaceBinary(places: Places) -> AnyPublisher<Data, Never> {
        return Future { promise in
            var newBuilder = FlatBufferBuilder(serializeDefaults: true)
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
            promise(.success(newBuilder.data))
        }.eraseToAnyPublisher()
    }
    
    fileprivate func fetchData() -> Data {
        guard let file = Bundle.main.url(forResource: "data", withExtension: "mon") else {
            fatalError("Couldnt load data.mon")
        }
        
        guard let data = try? Data(contentsOf: file) else {
            fatalError("Couldnt load data from \(file)")
        }
        return data
    }
    
    #if DEBUG
    static var getFirstPlace: Place {
        let data = Store().fetchData()
        let places = Places.getRootAsPlaces(bb: ByteBuffer(data: data))
        return places.data(at: 0)!
    }
    #endif
}
