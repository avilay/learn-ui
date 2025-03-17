//
//  ContentView.swift
//  LearnNavToolbar
//
//  Created by Avilay Parekh on 8/26/23.
//

import SwiftUI

struct ContentView: View {
    @State var isPresented = false
    @State var path = NavigationPath()  // only for debugging
    
    var body: some View {
        VStack {
            NavigationStack(path: $path) {
                List {
                    Section("Semantic") {
                        NavigationLink("Automatic") {
                            AutomaticItemView()
                        }
                        NavigationLink("Principal") {
                            PrincipalItemView()
                        }
                        NavigationLink("Status") {
                            StatusItemView()
                        }
                    }
                    Section("Placement") {
                        NavigationLink("Primary") {
                            PrimaryItemView()
                        }
                        NavigationLink("Secondary") {
                            SecondaryItemView()
                        }
                        NavigationLink("Confirm") {
                            ConfirmItemView()
                        }
                        NavigationLink("Cancel") {
                            CancelItemView()
                        }
                        NavigationLink("Destroy") {
                            DestroyItemView()
                        }
                        NavigationLink("Nav") {
                            NavItemView()
                        }
                    }
                    Section("Misc") {
                        NavigationLink("Modal") {
                            ModalView()
                        }
                    }
                }
            }
            Text("Total number of path elements: \(path.count)")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
