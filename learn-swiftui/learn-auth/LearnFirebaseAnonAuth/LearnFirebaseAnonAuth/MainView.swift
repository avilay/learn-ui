//
//  MainView.swift
//  LearnFirebaseAnonAuth
//
//  Created by Avilay Parekh on 9/2/23.
//

import SwiftUI
import FirebaseAuth

struct MainView: View {
    @EnvironmentObject var userSession: UserSession
    @State var items: [String] = []
    
    var body: some View {
        Group {
            List(items, id: \.self) { item in
                Text(item)
            }
            Button("Sign Out") {
                try? Auth.auth().signOut()
                userSession.isAuthenticated = false
            }
        }
        .onAppear {
            if userSession.isAuthenticated {
                let uid = Auth.auth().currentUser!.uid
                // Get this user's data from the backend
                items = [
                    "User Id: \(uid)",
                    "Item One",
                    "Item Two"
                ]
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
