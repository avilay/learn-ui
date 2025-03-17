//
//  RegistrationView.swift
//  LearnFirebaseAuth
//
//  Created by Avilay Parekh on 9/2/23.
//

import SwiftUI

struct RegistrationView: View {
    @State var email = ""
    @State var password = ""
    @State var reigstrationFail = false
    @State var registrationErrorMessage = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Register").font(.title)
            CredsForm(email: $email, password: $password)
            SubmitButton(
                action: "register",
                email: email,
                password: password,
                fail: $reigstrationFail,
                errorMessage: $registrationErrorMessage
            )
        }
        .alert("Unable to Register", isPresented: $reigstrationFail, actions: {}) {
            Text(registrationErrorMessage)
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
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView().padding(20)
    }
}
