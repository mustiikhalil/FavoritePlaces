//
//  PlacesCellView.swift
//  Favoriteplace
//
//  Created by Mustafa Khalil on 8/17/20.
//

import SwiftUI

struct PlacesCellView: View {
    var place: Place
    
    var body: some View {
        place
            .image
            .resizable()
            .frame(width: 180, height: 180, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .overlay(
                ZStack {
                    VStack {
                        Spacer()
                        ShadowView(name: place.name,
                                   isFavorite: place.isFavorite)
                    }.frame(minWidth: 0,
                            maxWidth: .infinity,
                            minHeight: 0,
                            maxHeight: .infinity,
                            alignment: .center)
                    Rectangle()
                        .stroke(Color.white, lineWidth: 4)
                }
            ).shadow(radius: 30)
    }
}

#if DEBUG
struct PlacesCellView_Previews: PreviewProvider {
    static var previews: some View {
        PlacesCellView(place: Store.getFirstPlace)
            .previewLayout(.fixed(width: 300, height: 300))
    }
}
#endif
