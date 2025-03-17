//
//  LearnFirebaseApp.swift
//  LearnFirebase
//
//  Created by Avilay Parekh on 9/1/23.
//

import SwiftUI
import FirebaseCore

@main
struct LearnFirebaseApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
