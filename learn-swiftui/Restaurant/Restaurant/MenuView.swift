//
//  MenuView.swift
//  Restaurant
//
//  Created by Avilay Parekh on 7/1/23.
//

import SwiftUI

struct MenuView: View {
    @State var menuItems: [MenuItem] = []
    var dataService = DataService()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Menu").font(.largeTitle).bold()
            List(menuItems) { menuItem in
                MenuListRowView(menuItem: menuItem)
            }
            .scrollContentBackground(.hidden)
            .onAppear {
                menuItems = dataService.menu
            }
            .padding(0)
        }
        .padding(.horizontal)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
