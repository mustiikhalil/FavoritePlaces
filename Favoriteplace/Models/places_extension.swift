//
//  places_extension.swift
//  Favoriteplace
//
//  Created by Mustafa Khalil on 8/17/20.
//

import Foundation
import SwiftUI
import CoreLocation

extension Place {
    
    var location: CLLocationCoordinate2D {
        //NOTE: Force unwrapping since we already know the data is going to be there!
        return CLLocationCoordinate2D(latitude: coordinates!.latitude,
                                      longitude: coordinates!.longitude)
    }
    
    var image: Image {
        return ImageStore.shared.retrieve(image: imageName)
    }
}

extension Place: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: Place, rhs: Place) -> Bool {
        lhs.id == rhs.id
    }
}

extension Category {
    
    var named: String {
        switch self {
        case .featured: return "Featured"
        case .lakes: return "Lakes"
        case .rivers: return "Rivers"
        }
    }
}
