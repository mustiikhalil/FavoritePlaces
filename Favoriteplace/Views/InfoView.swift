//
//  InfoView.swift
//  Favoriteplace
//
//  Created by Mustafa Khalil on 8/16/20.
//

import SwiftUI

struct InfoView: View {
    var place: Place
    
    var body: some View {
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
    }
}

#if DEBUG
struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(place: Store.getFirstPlace)
    }
}
#endif
