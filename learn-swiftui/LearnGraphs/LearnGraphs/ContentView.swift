//
//  ContentView.swift
//  LearnGraphs
//
//  Created by Avilay Parekh on 7/28/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            SimpleView().tabItem {
                Text("Simple")
            }
            GroupedView().tabItem {
                Text("Grouped")
            }
        }        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
