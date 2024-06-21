//
//  Assignment_1App.swift
//  Assignment_1
//
//  Created by Aditya Vyavahare on 19/06/24.
//

import SwiftUI

@main
struct Assignment_1App: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            WelcomeView()
        }
    }
}
