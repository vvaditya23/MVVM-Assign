//
//  LoginView.swift
//  Assignment_1
//
//  Created by Aditya Vyavahare on 22/06/24.
//

import SwiftUI

struct LoginView: View {
    @State private var password: String = ""
    @State private var email: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Text("Welcome Back 👻")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.purple)
                }
                
                Text("Login to your account with password")
                    .font(.body)
                    .foregroundColor(.gray)
                
                TextField("Enter Email", text: $email)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                
                SecureField("Enter Password", text: $password)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                
                Button(action: {
                    print("Login tapped")
                }) {
                    Text("Login to your account")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(25)
            .shadow(radius: 10)
            .padding()
        }
        .background(Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    LoginView()
}
