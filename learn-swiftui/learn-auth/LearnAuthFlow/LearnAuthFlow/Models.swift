//
//  Models.swift
//  LearnAuthFlow
//
//  Created by Avilay Parekh on 8/26/23.
//

import Foundation

class UserSession: ObservableObject {
    @Published var isAuthenticated: Bool
    @Published var userName: String?
    
    init() {
        isAuthenticated = UserDefaults.standard.bool(forKey: "isAuthenticated")
        userName = UserDefaults.standard.string(forKey: "userName") ?? ""
        if isAuthenticated {
            print("Loaded user session from UserDefaults")
        } else {
            print("User session not found in UserDefaults")
        }
    }
}

enum AuthServiceErrors: String, Error {
    case userExists = "User already exists"
    case userDoesNotExist = "User does not exist"
    case incorrectPassword = "Incorrect password"
    case invalidUserName = "Invalid user name"
    case invalidPassword = "Invalid password"
}

class AuthenticationService {
    static let authn: AuthenticationService = AuthenticationService()
    
    private var db: [String: String] = [:]
    
    private init() {
        db["happy@orange.com"] = "happy"
    }
    
    func createUser(email: String, password: String) async throws {
        try await Task.sleep(until: .now + .seconds(3), clock: .continuous)
        guard db[email] == nil else {
            throw AuthServiceErrors.userExists
        }
        guard email != "" else {
            throw AuthServiceErrors.invalidUserName
        }
        guard password != "" else {
            throw AuthServiceErrors.invalidPassword
        }
        db[email] = password
        print("Setting UserDefaults dict. When set for the first time it will throw the Unknown client error.")
        UserDefaults.standard.set(email, forKey: "userName")
        UserDefaults.standard.set(true, forKey: "isAuthenticated")
    }
    
    func checkPassword(email: String, password: String) async throws {
        try await Task.sleep(until: .now + .seconds(3), clock: .continuous)
        guard db[email] != nil else {
            throw AuthServiceErrors.userDoesNotExist
        }
        guard db[email] == password else {
            throw AuthServiceErrors.incorrectPassword
        }
        print("Setting UserDefaults dict. When set for the first time it will throw the Unknown client error.")
        UserDefaults.standard.set(email, forKey: "userName")
        UserDefaults.standard.set(true, forKey: "isAuthenticated")
    }
    
    func signOut() {
        print("Removing UserDefaults dict.")
        UserDefaults.standard.removeObject(forKey: "userName")
        UserDefaults.standard.removeObject(forKey: "isAuthenticated")
    }
}

class PreviewHelpers {
    func getMockUserSession() -> UserSession {
        let usess = UserSession()
        usess.isAuthenticated = true
        usess.userName = "happy@orange.com"
        return usess
    }
}
