//
//  AboutView.swift
//  Restaurant
//
//  Created by Avilay Parekh on 7/1/23.
//

import SwiftUI

let address = """
Tsukamoto Sogyo Building
Basement Floor 1
2-15, Ginza 4-chome
Chūō, Tokyo
"""

struct AboutView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("About").font(.largeTitle).bold()
                
                Image("restaurant-inside").resizable().aspectRatio(contentMode: .fit)
                
                Text("Sukiyabashi Jiro (すきやばし次郎, Sukiyabashi Jirō) is a sushi restaurant in Ginza, Chūō, Tokyo, Japan. It is owned and operated by sushi master Jiro Ono. It was the first sushi restaurant in the world to receive three stars from the Michelin Guide, although it was removed from the Michelin Guide in November 2019 as it does not receive reservations from the general public, instead requiring reservations to be made through the concierge of a luxury hotel.")
                
                Image("map").resizable().aspectRatio(contentMode: .fit)
                
                Text(address)
            }.padding()
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
