//
//  AutomaticItemView.swift
//  LearnNavToolbar
//
//  Created by Avilay Parekh on 8/26/23.
//

import SwiftUI

struct AutomaticItemView: View {
    @State var flag = false
    
    var body: some View {
        VStack {
            Text("This is the automatic placement demo")
            if flag {
                Image(systemName: "flag.fill").foregroundColor(.blue)
            } else {
                Image(systemName: "flag.fill").foregroundColor(.orange)
            }
        }
        .toolbar {
            ToolbarItem(placement: .automatic) {
                Button("Automatic") {
                    flag.toggle()
                }
            }
        }
    }
}

struct AutomaticItemView_Previews: PreviewProvider {
    static var previews: some View {
        AutomaticItemView()
    }
}
