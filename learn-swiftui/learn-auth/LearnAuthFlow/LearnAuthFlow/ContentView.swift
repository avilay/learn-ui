//
//  ContentView.swift
//  LearnAuthFlow
//
//  Created by Avilay Parekh on 8/26/23.
//

import SwiftUI

/*
 Remember to set the scene configuration to get rid of Info.plist error.
 https://stackoverflow.com/questions/74805019/info-plist-contained-no-uiscene-configuration-dictionary-looking-for-configurat
 */
struct ContentView: View {
    @EnvironmentObject var userSession: UserSession
    
    var body: some View {
        Group {
            if userSession.isAuthenticated {
                PrivateView()
            } else {
                LoginView()
            }
        }
        .padding(20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(UserSession())
    }
}
