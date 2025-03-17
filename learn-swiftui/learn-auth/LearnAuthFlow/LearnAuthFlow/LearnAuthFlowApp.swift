//
//  LearnAuthFlowApp.swift
//  LearnAuthFlow
//
//  Created by Avilay Parekh on 8/26/23.
//

import SwiftUI

@main
struct LearnAuthFlowApp: App {
    @StateObject var userSession: UserSession = UserSession()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(userSession)
        }
    }
}
