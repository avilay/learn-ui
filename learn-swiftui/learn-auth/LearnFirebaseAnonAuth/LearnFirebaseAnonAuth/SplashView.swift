//
//  SplashView.swift
//  LearnFirebaseAnonAuth
//
//  Created by Avilay Parekh on 9/2/23.
//

import SwiftUI
import FirebaseAuth

struct SplashView: View {
    @EnvironmentObject var userSession: UserSession
    @State var inProgress = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Splash View").font(.title)
            Button {
                inProgress = true
                Task {
                    try await Auth.auth().signInAnonymously()
                    userSession.isAuthenticated = true
                }
            } label: {
                if inProgress {
                    ProgressView()
                } else {
                    Text("Sign In")
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView().environmentObject(UserSession())
    }
}
