//
//  MainView.swift
//  Restaurant
//
//  Created by Avilay Parekh on 7/1/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            MenuView().tabItem {
//                VStack {
//                    Image(systemName: "menucard.fill")
//                    Text("Menu")
//                }
                Label("Menu", systemImage: "menucard.fill")
            }
            AboutView().tabItem {
//                VStack {
//                    Image(systemName: "info.circle.fill")
//                    Text("About")
//                }
                Label("About", systemImage: "info.circle.fill")
            }
            GalleryView().tabItem {
//                VStack {
//                    Image(systemName: "photo")
//                    Text("Gallery")
//                }
                Label("Gallery", systemImage: "photo")
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
