//
//  SecondaryItemView.swift
//  LearnNavToolbar
//
//  Created by Avilay Parekh on 8/26/23.
//

import SwiftUI

import SwiftUI

struct SecondaryItemView: View {
    @State var flag = false
    
    var body: some View {
        VStack {
            Text("This is the secondary placement demo")
            if flag {
                Image(systemName: "flag.fill").foregroundColor(.blue)
            } else {
                Image(systemName: "flag.fill").foregroundColor(.orange)
            }
        }
        .toolbar {
            ToolbarItem(placement: .secondaryAction) {
                Button("Secondary") {
                    flag.toggle()
                }
            }
        }
    }
}

struct SecondaryItemView_Previews: PreviewProvider {
    static var previews: some View {
        SecondaryItemView()
    }
}
