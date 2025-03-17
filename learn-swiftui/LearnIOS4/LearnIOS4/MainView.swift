//
//  MainView.swift
//  LearnIOS4
//
//  Created by Avilay Parekh on 7/3/23.
//

import SwiftUI

struct MainView: View {
    var ones = genData()
    
    var body: some View {
        NavigationStack {
            List(ones) { itemOne in
                NavigationLink {
                    LevelOneView(item: itemOne)
                } label: {
                    Text(itemOne.name)
                }
            }
            .navigationTitle("Item Ones")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
