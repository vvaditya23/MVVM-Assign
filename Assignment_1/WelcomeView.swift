//
//  ContentView.swift
//  Assignment_1
//
//  Created by Aditya Vyavahare on 19/06/24.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Match.Mingle")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.top, 100)
                        .padding(.leading, 15)
                    Spacer()
                }
                Spacer()
                Spacer()
                Text("Find you first Meta Matches")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                
                Text("Join us and socialize with millions of meta humans")
                    .font(.body)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                    .padding(.top, 10)
                
                Spacer()
                
                HStack {
                    NavigationLink(destination: SignupView()) {
                        HStack {
                            Image(systemName: "arrow.right")
                                .foregroundColor(.white)
                            Text("Get Started")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                        .padding(.horizontal, 40)
                    }
                    
                    HStack {
                        Button(action: {
                            print("Google signin")
                        }) {
                            Image("google_logo")
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                        .frame(width: 50, height: 50)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        
                        Button(action: {
                            print("Apple signin")
                        }) {
                            Image(systemName: "applelogo")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(.black)
                        }
                        .frame(width: 50, height: 50)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                    }
                    .padding(.trailing, 30)
                }
                .padding(.bottom)
                
                HStack {
                    NavigationLink(destination: LoginView()) {
                        Text("Already have a account?")
                            .foregroundColor(.gray)
                        Button(action: {
                        }) {
                            Text("Log In")
                                .foregroundColor(.red)
                                .fontWeight(.bold)
                        }
                    }
                }
                .padding(.bottom, 20)
            }
            .background(
                ZStack {
                    Color.white
                    Circle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: 200, height: 200)
                        .position(x: 50, y: 150)
                    Circle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: 150, height: 150)
                        .position(x: 300, y: 100)
                    Circle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: 100, height: 100)
                        .position(x: 100, y: 400)
                    Circle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: 180, height: 180)
                        .position(x: 250, y: 500)
                }
            )
            .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    WelcomeView()
}
