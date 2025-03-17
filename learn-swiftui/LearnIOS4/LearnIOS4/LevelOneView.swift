//
//  LevelOneView.swift
//  LearnIOS4
//
//  Created by Avilay Parekh on 7/3/23.
//

import SwiftUI

struct LevelOneView: View {
    var item: ItemOne
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Description").font(.title3).padding(.bottom, 7)
            Text(item.desc).padding(.bottom)
            Text("Item Twos").font(.title3).padding(.bottom, 7)
            ForEach(item.items) { itemTwo in
                NavigationLink {
                    LevelTwoView(item: itemTwo)
                } label: {
                    Text(itemTwo.title).padding(.bottom, 3)
                }
            }
            Spacer()
        }
        .navigationTitle(item.name)
        .padding()
    }
}

struct LevelOneView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            LevelOneView(item: genData()[0])
        }
    }
}
