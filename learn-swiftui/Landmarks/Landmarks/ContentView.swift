//
//  ContentView.swift
//  Landmarks
//
//  Created by Avilay Parekh on 2/20/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView().frame(height: 300).ignoresSafeArea(edges: .top)
            CircleImage().offset(y: -130).padding(.bottom, -130)
            VStack(alignment: .leading) {
                Text("Turtle Rock").font(.title)
                HStack {
                    Text("Joshua Tree National Park")
                    Spacer()
                    Text("California")
                }.font(.subheadline).foregroundColor(.secondary)
                Divider()
                Text("About Turtle Rock").font(.title2)
                Text("Descriptive text goes here")
            }.padding()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
