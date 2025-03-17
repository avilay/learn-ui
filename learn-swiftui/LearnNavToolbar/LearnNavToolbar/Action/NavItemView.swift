//
//  NavItemView.swift
//  LearnNavToolbar
//
//  Created by Avilay Parekh on 8/26/23.
//

import SwiftUI

struct NavItemView: View {
    @State var flag = false
    
    var body: some View {
        VStack {
            Text("This is the navigation placement demo")
            if flag {
                Image(systemName: "flag.fill").foregroundColor(.blue)
            } else {
                Image(systemName: "flag.fill").foregroundColor(.orange)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button("Navigation") {
                    flag.toggle()
                }
            }
        }
    }
}

struct NavItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavItemView()
    }
}
