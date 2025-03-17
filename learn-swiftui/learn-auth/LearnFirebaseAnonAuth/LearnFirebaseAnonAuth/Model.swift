//
//  Model.swift
//  LearnFirebaseAnonAuth
//
//  Created by Avilay Parekh on 9/2/23.
//

import Foundation
import FirebaseAuth

class UserSession: ObservableObject {
    @Published var isAuthenticated = false
    
    init() {
        isAuthenticated = Auth.auth().currentUser == nil ? false : true
    }
}
