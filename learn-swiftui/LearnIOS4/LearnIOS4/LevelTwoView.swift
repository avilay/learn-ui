//
//  LevelTwoView.swift
//  LearnIOS4
//
//  Created by Avilay Parekh on 7/3/23.
//

import SwiftUI

struct LevelTwoView: View {
    var item: ItemTwo
    
    var body: some View {
        VStack(alignment: .leading) {
            LabeledContent("Title", value: item.title)
            LabeledContent("Details", value: item.details)
            List(item.threes) { itemThree in
                Text(itemThree.label)
            }
        }
        .navigationTitle(item.title)
        .foregroundColor(.green)
        .padding()
    }
}

struct LevelTwoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            LevelTwoView(item: genData()[0].items[0])
        }
    }
}
