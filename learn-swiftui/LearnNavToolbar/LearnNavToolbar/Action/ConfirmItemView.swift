//
//  ConfirmItemView.swift
//  LearnNavToolbar
//
//  Created by Avilay Parekh on 8/26/23.
//

import SwiftUI

struct ConfirmItemView: View {
    @State var flag = false
    
    var body: some View {
        VStack {
            Text("This is the confirm placement demo")
            if flag {
                Image(systemName: "flag.fill").foregroundColor(.blue)
            } else {
                Image(systemName: "flag.fill").foregroundColor(.orange)
            }
        }
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Confirm") {
                    flag.toggle()
                }
            }
        }
    }
}

struct ConfirmItemView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmItemView()
    }
}
