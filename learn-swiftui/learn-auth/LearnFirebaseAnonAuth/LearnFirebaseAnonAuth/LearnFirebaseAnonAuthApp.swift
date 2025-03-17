//
//  LearnFirebaseAnonAuthApp.swift
//  LearnFirebaseAnonAuth
//
//  Created by Avilay Parekh on 9/2/23.
//

import SwiftUI
import FirebaseCore

@main
struct LearnFirebaseAnonAuthApp: App {
    @StateObject var userSession: UserSession = UserSession()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(userSession)
        }
    }
}
