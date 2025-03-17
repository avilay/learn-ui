//
//  Model.swift
//  LearnFirebaseAuth
//
//  Created by Avilay Parekh on 9/2/23.
//

import Foundation
import FirebaseAuth


class UserSession: ObservableObject {
    @Published var isAuthenticated: Bool
    
    init() {
        isAuthenticated = Auth.auth().currentUser != nil ? true : false
    }
}
