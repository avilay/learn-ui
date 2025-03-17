//
//  SubmitButton.swift
//  LearnAuthFlow
//
//  Created by Avilay Parekh on 8/26/23.
//

import SwiftUI

struct SubmitButton: View {
    @EnvironmentObject var userSession: UserSession
    @State var inProgress = false
    let action: String
    let email: String
    let password: String
    @Binding var fail: Bool
    
    var body: some View {
        Button {
            inProgress = true
            Task {
                do {
                    if action == "login" {
                        try await AuthenticationService.authn.checkPassword(email: email, password: password)
                    } else {
                        try await AuthenticationService.authn.createUser(email: email, password: password)
                    }
                    inProgress = false
                    userSession.isAuthenticated = true
                    userSession.userName = email
                } catch {
                    inProgress = false
                    print("Error: \(error)")
                    fail = true
                }
            }
        } label: {
            if inProgress {
                ProgressView().frame(width: 100)
            } else {
                Text("Sign In").frame(width: 100)
            }
        }
        .buttonStyle(.borderedProminent)
        .opacity(inProgress ? 0.5 : 1.0)
    }
}

struct SubmitButton_Previews: PreviewProvider {
    static var previews: some View {
        SubmitButton(
            action: "login",
            email: "a@b.com",
            password: "123",
            fail: .constant(false)
        ).environmentObject(UserSession())
    }
}
