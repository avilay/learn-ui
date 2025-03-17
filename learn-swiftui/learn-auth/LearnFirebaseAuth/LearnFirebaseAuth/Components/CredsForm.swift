//
//  CredsForm.swift
//  LearnFirebaseAuth
//
//  Created by Avilay Parekh on 9/2/23.
//

import SwiftUI

struct CredsForm: View {
    @Binding var email: String
    @Binding var password: String
    
    var body: some View {
        Form {
            TextField(
                "Email",
                text: $email,
                prompt: Text("name@example.com")
            ).autocapitalization(.none)
            SecureField("Password", text: $password, prompt: Text("password"))
        }
        .frame(height: 150)
    }
}

struct CredsForm_Previews: PreviewProvider {
    static var previews: some View {
        CredsForm(email: .constant(""), password: .constant(""))
    }
}
