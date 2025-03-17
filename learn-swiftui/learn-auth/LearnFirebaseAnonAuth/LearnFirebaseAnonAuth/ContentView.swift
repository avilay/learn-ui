//
//  ContentView.swift
//  LearnFirebaseAnonAuth
//
//  Created by Avilay Parekh on 9/2/23.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @EnvironmentObject var userSession: UserSession
    
    var body: some View {
        Group {
            if userSession.isAuthenticated {
                MainView()
            } else {
                SplashView()
            }
        }        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(UserSession())
    }
}
