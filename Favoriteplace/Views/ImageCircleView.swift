//
//  ImageCircleView.swift
//  Favoriteplace
//
//  Created by Mustafa Khalil on 8/16/20.
//

import SwiftUI

struct ImageCircleView: View {
    var body: some View {
        Image("turtlerock")
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white, lineWidth: 4)
            ).shadow(radius: 10)
    }
}

struct ImageCircleView_Previews: PreviewProvider {
    static var previews: some View {
        ImageCircleView()
    }
}
