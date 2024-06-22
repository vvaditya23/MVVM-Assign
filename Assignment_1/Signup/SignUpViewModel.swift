//
//  SignupViewModel.swift
//  Assignment_1
//
//  Created by Aditya Vyavahare on 22/06/24.
//

import Combine
import FirebaseAuth

class SignUpViewModel: ObservableObject {
    @Published var showAlert: Bool = false
    @Published var alertTitle: String = ""
    @Published var alertBody: String = ""
    
    func signUp(with data: SignUpData) {
        Auth.auth().createUser(withEmail: data.email, password: data.password) { authResult, error in
            if let error = error as? NSError {
                if let authErrorCode = AuthErrorCode.Code(rawValue: error.code) {
                    switch authErrorCode {
                    case .operationNotAllowed:
                        print("Error: The given sign-in provider is disabled for this Firebase project. Enable it in the Firebase console, under the sign-in method tab of the Auth section.")
                        self.showAlert = true
                        self.alertTitle = "SignUp failed!"
                        self.alertBody = "The given sign-in provider is disabled for this Firebase project. Enable it in the Firebase console, under the sign-in method tab of the Auth section."
                    case .emailAlreadyInUse:
                        print("Error: The email address is already in use by another account.")
                        self.showAlert = true
                        self.alertTitle = "SignUp failed!"
                        self.alertBody = "The email address is already in use by another account."
                    case .invalidEmail:
                        print("Error: The email address is badly formatted.")
                        self.showAlert = true
                        self.alertTitle = "SignUp failed!"
                        self.alertBody = "The email address is badly formatted."
                    case .weakPassword:
                        print("Error: The password must be 6 characters long or more.")
                        self.showAlert = true
                        self.alertTitle = "SignUp failed!"
                        self.alertBody = "The password must be 6 characters long or more."
                    default:
                        print("Error: \(error.localizedDescription)")
                        self.showAlert = true
                        self.alertTitle = "SignUp failed!"
                        self.alertBody = "Unknown error occured."
                    }
                } else {
                    print("Error: \(error.localizedDescription)")
                }
            } else {
                print("User signs up successfully")
                self.showAlert = true
                self.alertTitle = "SignUp successful!"
                self.alertBody = "You can login now."
                let newUserInfo = Auth.auth().currentUser
                let email = newUserInfo?.email
              }
        }
    }
}
