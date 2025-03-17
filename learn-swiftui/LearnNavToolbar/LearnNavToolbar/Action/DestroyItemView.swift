//
//  DestroyItemView.swift
//  LearnNavToolbar
//
//  Created by Avilay Parekh on 8/26/23.
//

import SwiftUI

struct DestroyItemView: View {
    @State var flag = false
    
    var body: some View {
        VStack {
            Text("This is the destroy placement demo")
            if flag {
                Image(systemName: "flag.fill").foregroundColor(.blue)
            } else {
                Image(systemName: "flag.fill").foregroundColor(.orange)
            }
        }
        .toolbar {
            ToolbarItem(placement: .destructiveAction) {
                Button("Destroy") {
                    flag.toggle()
                }
            }
        }
    }
}

struct DestroyItemView_Previews: PreviewProvider {
    static var previews: some View {
        DestroyItemView()
    }
}
