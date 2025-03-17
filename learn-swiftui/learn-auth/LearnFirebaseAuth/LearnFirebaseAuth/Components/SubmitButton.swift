//
//  SubmitButton.swift
//  LearnFirebaseAuth
//
//  Created by Avilay Parekh on 9/2/23.
//

import SwiftUI
import FirebaseAuth

enum AuthError: String, Error {
    case unsupportedAction = "Unsupported Action"
}

struct SubmitButton: View {
    @State var inProgress = false
    let action: String
    let email: String
    let password: String
    let label = [
        "login": "Sign In",
        "register": "Sign Up"
    ]
    @Binding var fail: Bool
    @Binding var errorMessage: String
    @EnvironmentObject var userSession: UserSession
    
    var body: some View {
        Button {
            inProgress = true
            Task {
                do {
                    if action == "login" {
                        try await Auth.auth().signIn(withEmail: email, password: password)
                    } else if action == "register" {
                        try await Auth.auth().createUser(withEmail: email, password: password)
                    } else {
                        throw AuthError.unsupportedAction
                    }
                    userSession.isAuthenticated = true
                    inProgress = false
                } catch {
                    inProgress = false
                    print("Error: \(error)")
                    errorMessage = error.localizedDescription
                    fail = true
                }
            }
        } label: {
            if inProgress {
                ProgressView().frame(minWidth: 100)
            } else {
                Text(label[action]!).frame(width: 100)
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
            fail: .constant(false),
            errorMessage: .constant("")
        )
    }
}
