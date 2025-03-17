//
//  LoginView.swift
//  LearnAuthFlow
//
//  Created by Avilay Parekh on 8/26/23.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    @State var loginFail = false
    @State var showRegister = false
    @State var inProgress = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Login").font(.title)
                CredsForm(email: $email, password: $password)
                SubmitButton(action: "login", email: email, password: password, fail: $loginFail)
            }
            .alert("Incorrect Login", isPresented: $loginFail, actions: {}) {
                Text("Username does not match with password. Try again.")
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
        LoginView().environmentObject(UserSession()).padding(20)
    }
}
