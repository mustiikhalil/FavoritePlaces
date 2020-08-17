//
//  ShadowView.swift
//  Favoriteplace
//
//  Created by Mustafa Khalil on 8/17/20.
//

import SwiftUI

struct ShadowView: View {
    var place: Place
    
    var body: some View {
        VStack(alignment: .center) {
            Text(place.name)
        }
        .foregroundColor(.white)
        .padding(.all)
        .frame(maxWidth: .infinity)
        .background(Color.init(.sRGB, white: 0, opacity: 0.7))
    }
}

#if DEBUG
struct ShadowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ShadowView(place: Store.getFirstPlace)
            ShadowView(place: Store.getFirstPlace)
        }.previewLayout(.fixed(width: 300, height: 300))
    }
}
#endif
