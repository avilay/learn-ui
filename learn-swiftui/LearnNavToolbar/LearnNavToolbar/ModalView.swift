//
//  ModalView.swift
//  LearnNavToolbar
//
//  Created by Avilay Parekh on 8/26/23.
//

import SwiftUI

struct PopupView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("This is the popup")
            }
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Text("Automatic")
                }
            }
        }
    }
}

struct ModalView: View {
    @State var isPresented = false
    
    var body: some View {
        VStack {
            Text("This is the modal view demo")
        }
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button("Popup") {
                    isPresented = true
                }
            }
        }
        .sheet(isPresented: $isPresented) {
            PopupView()
        }
    }
}


struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
    }
}
