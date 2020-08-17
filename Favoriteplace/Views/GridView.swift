//
//  GridView.swift
//  Favoriteplace
//
//  Created by Mustafa Khalil on 8/17/20.
//

import SwiftUI

struct GridView: View {
    @EnvironmentObject var viewModel: GridViewModel
    var columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, alignment: .center, spacing: 10)
                {
                    ForEach(0..<viewModel.count) { index in
                        let place = viewModel.getPlace(at: index)
                        NavigationLink(destination: DetailsView(place: place)) {
                            PlacesCellView(place: place)
                        }
                    }
                }
            }
            .navigationTitle(Text("Places"))
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#if DEBUG
struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView().environmentObject(GridViewModel())
    }
}
#endif
