//
//  StatusItemView.swift
//  LearnNavToolbar
//
//  Created by Avilay Parekh on 8/26/23.
//

import SwiftUI

struct StatusItemView: View {
    var body: some View {
        VStack {
            Text("This is the status placement demo")
        }
        .toolbar {
            ToolbarItem(placement: .status) {
                Text("Status")
            }
        }
    }
}


struct StatusItemView_Previews: PreviewProvider {
    static var previews: some View {
        StatusItemView()
    }
}
