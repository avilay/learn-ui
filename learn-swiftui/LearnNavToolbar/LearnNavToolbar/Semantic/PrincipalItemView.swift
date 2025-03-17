//
//  PrincipalItemView.swift
//  LearnNavToolbar
//
//  Created by Avilay Parekh on 8/26/23.
//

import SwiftUI

struct PrincipalItemView: View {
    var body: some View {
        VStack {
            Text("This is the primary placement demo")
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Principal")
            }
        }
    }
}


struct PrincipalItemView_Previews: PreviewProvider {
    static var previews: some View {
        PrincipalItemView()
    }
}
