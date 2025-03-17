//
//  TwoView.swift
//  ScratchApp2
//
//  Created by Avilay Parekh on 8/26/23.
//

import SwiftUI

struct TwoView: View {
    @Binding var flag: Bool
    
    var body: some View {
        Text("Two View")
    }
}

struct TwoView_Previews: PreviewProvider {
    static var previews: some View {
        TwoView(flag: .constant(true))
    }
}
