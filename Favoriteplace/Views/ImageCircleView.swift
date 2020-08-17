//
//  ImageCircleView.swift
//  Favoriteplace
//
//  Created by Mustafa Khalil on 8/16/20.
//

import SwiftUI

struct ImageCircleView: View {
    var image: Image
    
    var body: some View {
        image
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white, lineWidth: 4)
            ).shadow(radius: 10)
    }
}

#if DEBUG
struct ImageCircleView_Previews: PreviewProvider {
    static var previews: some View {
        ImageCircleView(image: Store.getFirstPlace.image)
    }
}
#endif
