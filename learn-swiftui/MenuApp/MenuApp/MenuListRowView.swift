//
//  MenuListRowView.swift
//  MenuApp
//
//  Created by Avilay Parekh on 7/1/23.
//

import SwiftUI

struct MenuListRowView: View {
    var menuItem: MenuItem
    
    var body: some View {
        HStack {
            Image(menuItem.imageName).resizable().aspectRatio(contentMode: .fit).frame(height: 50).cornerRadius(10)
            Text(menuItem.name).bold()
            Spacer()
            Text("$\(menuItem.price)")
        }.listRowSeparator(.hidden).listRowBackground(Color(.brown).opacity(0.05))
    }
}

struct MenuListRowView_Previews: PreviewProvider {
    static var previews: some View {
        MenuListRowView(menuItem: MenuItem(name: "Test Item", price: "0.0", imageName: "avocado-maki"))
    }
}
