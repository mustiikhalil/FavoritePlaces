//
//  DetailsView.swift
//  Favoriteplace
//
//  Created by Mustafa Khalil on 8/16/20.
//

import SwiftUI

struct DetailsView: View {
    var place: Place
    
    var body: some View {
        VStack {
            MapView(coordinate: place.location)
                .frame(height: 300)
            ImageCircleView(image: place.image)
                .offset(y: -130).padding(.bottom, -130)
            InfoView(place: place)
            Spacer()
        }
        .ignoresSafeArea(.all, edges: .top)
        .navigationBarTitle(Text(place.name), displayMode: .inline)
    }
}

#if DEBUG
struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DetailsView(place: Store.getFirstPlace)
                .previewDevice("iPhone 11 Pro")
        }
    }
}
#endif
