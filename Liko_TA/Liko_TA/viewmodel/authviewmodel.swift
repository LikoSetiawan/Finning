//
//  authviewmodel.swift
//  Liko_TA
//
//  Created by Liko Setiawan on 17/05/23.
//

import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var isLoggedin = false
    
    init() {
        checkUserLoginState()
    }
    
    func checkUserLoginState() {
        Auth.auth().addStateDidChangeListener { [weak self] (_, user) in
            self?.isLoggedin = user != nil
        }
    }
    
    func loginUser(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            if let error = error {
                print("Failed due to error:", error)
                return
            }
            
            print("Successfully logged in with ID: \(result?.user.uid ?? "")")
            self?.isLoggedin = true
        }
    }
    
    func logoutUser() {
        do {
            try Auth.auth().signOut()
            isLoggedin = false
        } catch {
            print("Failed to log out:", error)
        }
    }
    
    func createUser(email: String, password: String) {
            Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
                if let error = error {
                    print("Failed due to error:", error)
                    return
                }
                
                print("Successfully created account with ID: \(result?.user.uid ?? "")")
                
                self?.isLoggedin = true
            }
        }
    
    
    
}




