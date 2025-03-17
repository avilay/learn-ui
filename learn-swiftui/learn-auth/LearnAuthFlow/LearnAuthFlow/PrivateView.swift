//
//  PrivateView.swift
//  LearnAuthFlow
//
//  Created by Avilay Parekh on 8/26/23.
//

import SwiftUI

struct PrivateView: View {
    @EnvironmentObject var userSession: UserSession
    
    var body: some View {
        VStack {
            Text("Welcome \(userSession.userName!)!").font(.title).foregroundColor(.gray)
            Spacer()
            Button("Sign Out") {
                AuthenticationService.authn.signOut()
                userSession.userName = ""
                userSession.isAuthenticated = false
            }
        }
        
    }
}

struct PrivateView_Previews: PreviewProvider {
    static var previews: some View {
        PrivateView().environmentObject(PreviewHelpers().getMockUserSession()).padding(20)
    }
}
