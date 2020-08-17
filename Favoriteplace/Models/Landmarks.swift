//
//  Landmarks.swift
//  Favoriteplace
//
//  Created by Mustafa Khalil on 8/17/20.
//

// TODO: - Code we dont need!
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable {
    var id: Int
    var name: String
    fileprivate var imageName: String
    fileprivate var coordinates: Coordinates2
    var state: String
    var park: String
    var city: String
    var category: Category2

    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    enum Category2: String, CaseIterable, Codable, Hashable {
        case featured = "Featured"
        case lakes = "Lakes"
        case rivers = "Rivers"
        
        var converted: Category {
            switch self {
            case .featured: return .featured
            case .lakes: return .lakes
            case .rivers: return .rivers
            }
        }
    }
}

extension Landmark {
//    var image: Image {
//        ImageStore.shared.image(name: imageName)
//    }
}

struct Coordinates2: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
