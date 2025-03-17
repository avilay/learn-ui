//
//  OneView.swift
//  ScratchApp2
//
//  Created by Avilay Parekh on 8/26/23.
//

import SwiftUI

struct OneView: View {
    @Binding var flag: Bool
    
    var body: some View {
        Text("One View")
    }
}

struct OneView_Previews: PreviewProvider {
    static var previews: some View {
        OneView(flag: .constant(true))
    }
}
