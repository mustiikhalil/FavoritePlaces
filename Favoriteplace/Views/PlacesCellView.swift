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
            .scaledToFill()
            .overlay(
                ZStack {
                    VStack {
                        Spacer()
                        ShadowView(place: place)
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
