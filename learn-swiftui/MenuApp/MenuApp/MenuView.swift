//
//  ContentView.swift
//  MenuApp
//
//  Created by Avilay Parekh on 7/1/23.
//

import SwiftUI

struct MenuView: View {
    @State var menuItems: [MenuItem] = []
    var dataService = DataService()
    
    var body: some View {
        List(menuItems) { menuItem in
            MenuListRowView(menuItem: menuItem)
        }.onAppear {
            menuItems = dataService.data
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
