//
//  DetailsView.swift
//  Favoriteplace
//
//  Created by Mustafa Khalil on 8/16/20.
//

import SwiftUI

struct DetailsView: View {
    var body: some View {
        VStack {
            MapView()
                .frame(height: 300)
            ImageCircleView()
                .offset(y: -130).padding(.bottom, -130)
            InfoView()
            Spacer()
        }.ignoresSafeArea(.all, edges: .top)
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DetailsView()
                .previewDevice("iPhone 11 Pro")
        }
    }
}
