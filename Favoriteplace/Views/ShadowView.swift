//
//  ShadowView.swift
//  Favoriteplace
//
//  Created by Mustafa Khalil on 8/17/20.
//

import SwiftUI

struct ShadowView: View {
    var name: String
    
    var body: some View {
        VStack(alignment: .center) {
            Text(name)
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
            ShadowView(name: Store.getFirstPlace.name)
            ShadowView(name: Store.getFirstPlace.name)
        }.previewLayout(.fixed(width: 300, height: 300))
    }
}
#endif
