//
//  PrimaryItemView.swift
//  LearnNavToolbar
//
//  Created by Avilay Parekh on 8/26/23.
//

import SwiftUI

struct PrimaryItemView: View {
    @State var flag = false
    
    var body: some View {
        VStack {
            Text("Primary Item View")
            if flag {
                Image(systemName: "flag.fill").foregroundColor(.blue)
            } else {
                Image(systemName: "flag.fill").foregroundColor(.orange)
            }
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button("Primary") {
                    flag.toggle()
                }
            }
        }
    }
}

struct PrimaryItemView_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryItemView()
    }
}
