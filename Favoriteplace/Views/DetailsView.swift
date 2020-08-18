//
//  DetailsView.swift
//  Favoriteplace
//
//  Created by Mustafa Khalil on 8/16/20.
//

import SwiftUI

struct DetailsView: View {
    var place: Place
    
    init(place: Place) {
        Swift.withUnsafePointer(to: place) { p in
            print("details: ", p)
        }
        self.place = place
    }
    
    var body: some View {
        VStack {
            MapView(coordinate: place.location)
                .frame(height: 300)
            ImageCircleView(image: place.image)
                .offset(y: -130).padding(.bottom, -130)
            VStack(alignment: .leading) {
                Text(place.name)
                    .font(.title)
                HStack {
                    Text(place.park)
                        .font(.subheadline)
                    Spacer()
                    Text(place.state)
                        .font(.subheadline)
                }
            }.padding()
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
