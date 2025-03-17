//
//  LoginView.swift
//  LearnFirebaseAuth
//
//  Created by Avilay Parekh on 9/2/23.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    @State var loginFail = false
    @State var loginErrorMessage = ""
    @State var showRegister = false
    @State var inProgress = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Login").font(.title)
                CredsForm(email: $email, password: $password)
                SubmitButton(
                    action: "login",
                    email: email,
                    password: password,
                    fail: $loginFail,
                    errorMessage: $loginErrorMessage
                )
            }
            .alert("Incorrect Login", isPresented: $loginFail, actions: {}) {
                Text(loginErrorMessage)
            }
            .toolbar {
                ToolbarItem(placement: .status) {
                    Button {
                        showRegister = true
                    } label: {
                        HStack {
                            Text("New to the app? ")
                            Text("Sign up").bold()
                        }
                    }
                }
            }
            .navigationDestination(isPresented: $showRegister) {
                RegistrationView()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().padding(20)
    }
}
