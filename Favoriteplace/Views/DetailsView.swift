//
//  DetailsView.swift
//  Favoriteplace
//
//  Created by Mustafa Khalil on 8/16/20.
//

import SwiftUI

struct DetailsView: View {
    @EnvironmentObject var viewModel: GridViewModel
    
    var place: Place
    var index: Int
    
    var body: some View {
        VStack {
            MapView(coordinate: place.location)
                .frame(height: 300)
            ImageCircleView(image: place.image)
                .offset(y: -130).padding(.bottom, -130)
            VStack(alignment: .leading) {
                HStack {
                    Text(place.name)
                        .font(.title)
                    Button(action: {
                        self.viewModel.isFavorite(!place.isFavorite, at: index)
                    }, label: {
                        if place.isFavorite {
                            Image(systemName: "star.fill")
                                .imageScale(.medium)
                                .foregroundColor(.yellow)
                        } else {
                            Image(systemName: "star")
                                .imageScale(.medium)
                                .foregroundColor(.gray)
                        }
                    })
                }
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
            DetailsView(place: Store.getFirstPlace, index: 0)
                .previewDevice("iPhone 11 Pro")
        }
    }
}
#endif
