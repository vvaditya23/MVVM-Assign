//
//  FormList.swift
//  Assignment_1
//
//  Created by Aditya Vyavahare on 21/06/24.
//

import SwiftUI

struct SignUpView: View {
    @StateObject private var viewModel = SignUpViewModel()
    @State private var signupData = SignUpData(fullName: "",
                                               email: "",
                                               password: "",
                                               phoneNumber: "",
                                               showNameToAll: true,
                                               privacySetting: 0)
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Let's get to know each other 👋")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            TextField("Enter Full Name", text: $signupData.fullName)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            
            Toggle(isOn: $signupData.showNameToAll) {
                VStack(alignment: .leading) {
                    Text("Show my name to all")
                    Text("If you turn off, you won't be able to see name of other members")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            
            TextField("Enter Email", text: $signupData.email)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .keyboardType(.emailAddress)
                .textCase(.lowercase)
            
            SecureField("Enter Password", text: $signupData.password)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            
            TextField("Enter Phone Number", text: $signupData.phoneNumber)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            
            Text("Contact Privacy Settings")
                .font(.headline)
                .foregroundColor(.black)
            
            Picker(selection: $signupData.privacySetting, label: Text("")) {
                Text("Show to all").tag(0)
                Text("Hide from all").tag(1)
                Text("Show to the members I express interest in").tag(2)
            }
            .pickerStyle(.segmented)
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            
            Spacer()
            
            Button(action: {
                viewModel.signUp(with: signupData)
            }) {
                Text("SignUp")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(10)
            }
        }
        .padding()
        .alert(isPresented: $viewModel.showAlert) {
            Alert(title: Text(viewModel.alertTitle), message: Text(viewModel.alertBody), dismissButton: .default(Text("Okay")))
        }
    }
}

#Preview {
    SignUpView()
}
