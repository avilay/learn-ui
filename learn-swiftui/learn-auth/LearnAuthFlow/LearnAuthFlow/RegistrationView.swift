//
//  RegistrationView.swift
//  LearnAuthFlow
//
//  Created by Avilay Parekh on 8/26/23.
//

import SwiftUI

struct RegistrationView: View {
    @State var email = ""
    @State var password = ""
    @State var registrationFail = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Register").font(.title)
            CredsForm(email: $email, password: $password)
            SubmitButton(action: "register", email: email, password: password, fail: $registrationFail)
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .status) {
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Text("Already a user? ")
                        Text("Sign in").bold()
                    }
                }
            }
        }
        .alert("Unable to Register", isPresented: $registrationFail, actions: {}) {
            Text("Email already registered. Try signing in.")
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RegistrationView().environmentObject(UserSession()).padding(20)
        }
    }
}
