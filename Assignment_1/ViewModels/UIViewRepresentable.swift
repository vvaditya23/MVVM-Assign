//
//  UIViewRepresentable.swift
//  Assignment_1
//
//  Created by Aditya Vyavahare on 22/06/24.
//

import SwiftUI
import GoogleSignIn

struct GoogleSignInCoordinator: UIViewControllerRepresentable {
    class Coordinator: NSObject {
        var parent: GoogleSignInCoordinator
        
        init(parent: GoogleSignInCoordinator) {
            self.parent = parent
        }
        
        func signIn() {
            if let viewController = UIApplication.shared.windows.first?.rootViewController {
                GIDSignIn.sharedInstance.signIn(withPresenting: viewController) { signInResult, error in
                    if let error = error {
                        print("Error signing in with Google: \(error.localizedDescription)")
                        // Handle the error appropriately, e.g., show an alert to the user
                        return
                    }
                    
                    guard let signInResult = signInResult else {
                        print("No sign in result.")
                        // Handle the case where there's no result
                        return
                    }
                    
                    // Access the user information from signInResult
                    let user = signInResult.user
                    print("UserData->")
                    print("Email: \(user.profile?.email)")
                    print("Name: \(user.profile?.name)")
                    let idToken = user.idToken?.tokenString
                    let accessToken = user.accessToken.tokenString
                }
            }
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> UIViewController {
        return UIViewController()
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
