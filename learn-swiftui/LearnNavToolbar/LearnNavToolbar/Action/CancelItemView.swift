//
//  CancelItemView.swift
//  LearnNavToolbar
//
//  Created by Avilay Parekh on 8/26/23.
//

import SwiftUI

struct CancelItemView: View {
    @State var flag = false
    
    var body: some View {
        VStack {
            Text("This is the cancel placement demo")
            if flag {
                Image(systemName: "flag.fill").foregroundColor(.blue)
            } else {
                Image(systemName: "flag.fill").foregroundColor(.orange)
            }
        }
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    flag.toggle()
                }
            }
        }
    }
}

struct CancelItemView_Previews: PreviewProvider {
    static var previews: some View {
        CancelItemView()
    }
}
