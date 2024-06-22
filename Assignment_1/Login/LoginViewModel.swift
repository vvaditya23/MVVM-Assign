//
//  LoginViewModel.swift
//  Assignment_1
//
//  Created by Aditya Vyavahare on 22/06/24.
//

import Combine
import FirebaseAuth

class LoginViewModel: ObservableObject{
    @Published var emailToShow: String = ""
    @Published var errorMessage = ""
    @Published var isLoggedIn: Bool = false
    @Published var isLoggedout: Bool = false
    @Published var showAlert: Bool = false
    @Published var alertTitle: String = ""
    @Published var alertBody: String = ""
    @Published var loggedOutText: String = ""
    private var handler = Auth.auth().addStateDidChangeListener{_,_ in }
    
    func signIn(with data: LoginData) {        
        Auth.auth().signIn(withEmail: data.email, password: data.password) { authResult, error in
            if let error = error as? NSError {
                if let authErrorCode = AuthErrorCode.Code(rawValue: error.code) {
                    switch authErrorCode {
                    case .operationNotAllowed:
                        print("Error: The given sign-in provider is disabled for this Firebase project. Enable it in the Firebase console, under the sign-in method tab of the Auth section.")
                        self.showAlert = true
                        self.alertTitle = "SignUp failed!"
                        self.alertBody = "The given sign-in provider is disabled for this Firebase project. Enable it in the Firebase console, under the sign-in method tab of the Auth section."
                        
                    case .invalidEmail:
                        print("Error: The email address is badly formatted.")
                        self.showAlert = true
                        self.alertTitle = "SignUp failed!"
                        self.alertBody = "The email address is badly formatted."
                        
                    case .userMismatch:
                        print("Error: User mismatched.")
                        self.showAlert = true
                        self.alertTitle = "Login failed!"
                        self.alertBody = "The user you are trying to login is mismatched."
                        
                    case .userNotFound:
                        print("Error: User not found.")
                        self.showAlert = true
                        self.alertTitle = "Login failed!"
                        self.alertBody = "The user does not exist, please signup first."
                        
                    case .wrongPassword:
                        print("Error: Wrong password.")
                        self.showAlert = true
                        self.alertTitle = "Login failed!"
                        self.alertBody = "The password you have entered is incorrect."
                    default:
                        print("Error: Unknown error occured.")
                        self.showAlert = true
                        self.alertTitle = "Login failed!"
                        self.alertBody = "Unknown error occured."
                        
                    }
                }
            } else {
                print("User logged in successfully")
                self.isLoggedIn = true
                let newUserInfo = Auth.auth().currentUser
                let email = newUserInfo?.email
                self.emailToShow = email ?? ""
            }
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            isLoggedIn = false
            isLoggedout = true
            loggedOutText = "User logged out successfully"
        } catch {
            print("Errorrrrr")
        }
    }
}
