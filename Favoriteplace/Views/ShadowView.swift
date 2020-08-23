//
//  ShadowView.swift
//  Favoriteplace
//
//  Created by Mustafa Khalil on 8/17/20.
//

import SwiftUI

struct ShadowView: View {
    var name: String
    var isFavorite: Bool
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Text(name)
                    .foregroundColor(.white)
                Spacer()
                if isFavorite {
                    Image(systemName: "star.fill")
                        .imageScale(.medium)
                        .foregroundColor(.yellow)
                }
            }.padding(.horizontal)
        }
        .padding(.all)
        .frame(maxWidth: .infinity)
        .background(Color.init(.sRGB, white: 0, opacity: 0.7))
    }
}

#if DEBUG
struct ShadowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ShadowView(name: Store.getFirstPlace.name, isFavorite: true)
            ShadowView(name: Store.getFirstPlace.name, isFavorite: false)
        }.previewLayout(.fixed(width: 300, height: 300))
    }
}
#endif
