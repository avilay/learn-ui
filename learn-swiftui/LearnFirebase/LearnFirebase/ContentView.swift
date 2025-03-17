//
//  ContentView.swift
//  LearnFirebase
//
//  Created by Avilay Parekh on 9/1/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            GenresView().tabItem {
                Text("Genres")
            }
            VideoGamesView().tabItem {
                Text("Video Games")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
