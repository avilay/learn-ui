//
//  PrivateView.swift
//  LearnFirebaseAuth
//
//  Created by Avilay Parekh on 9/2/23.
//

import SwiftUI
import FirebaseAuth

struct PrivateView: View {
    @EnvironmentObject var userSession: UserSession
    
    func dateToString(_ date: Date?) -> String {
        if date == nil {
            return ""
        }
        let df = DateFormatter()
        df.dateStyle = .medium
        df.timeStyle = .short
        return df.string(from: date!)
    }
    
    var body: some View {
        if userSession.isAuthenticated {
            let user = Auth.auth().currentUser!
            VStack(alignment: .leading, spacing: 10) {
                Text("Welcome user \(user.uid)").font(.title2)
                Text("Provider ID: \(user.providerID)")
                Text("Name: \(user.displayName ?? "")")
                Text("Photo: \(user.photoURL?.absoluteString ?? "")")
                Text("Email: \(user.email ?? "")")
                Text("Phone: \(user.phoneNumber ?? "")")
                Text("Last sign in on: \(dateToString(user.metadata.lastSignInDate))")
                Text("Created on: \(dateToString(user.metadata.creationDate))")
                Spacer()
                Button("Sign Out") {
                    try? Auth.auth().signOut()                    
                    userSession.isAuthenticated = false
                }
            }
        } else {
            Text("You need to sign in to view this content!")
        }
    }
}

struct PrivateView_Previews: PreviewProvider {
    static var previews: some View {
        PrivateView().padding(20)
    }
}
