//
//  AppDelegate.swift
//  Assignment_1
//
//  Created by Aditya Vyavahare on 22/06/24.
//

import UIKit
import GoogleSignIn
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
            if error != nil || user == nil {
                // Show the app's signed-out state.
            } else {
                // Show the app's signed-in state.
            }
        }
        FirebaseApp.configure()
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        var handeled: Bool
        
        handeled = GIDSignIn.sharedInstance.handle(url)
        if handeled {
            return true
        }
        return false
    }
}
