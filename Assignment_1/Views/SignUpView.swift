//
//  FormList.swift
//  Assignment_1
//
//  Created by Aditya Vyavahare on 21/06/24.
//

import SwiftUI

struct SignUpView: View {
    @StateObject private var viewModel = SignUpViewModel()

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Let's get to know each other 👋")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            TextField("Enter Full Name", text: $viewModel.fullName)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            
            Toggle(isOn: $viewModel.showNameToAll) {
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
            
            TextField("Enter Email", text: $viewModel.email)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .keyboardType(.emailAddress)
                .textCase(.lowercase)
            
            SecureField("Enter Password", text: $viewModel.password)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            
            TextField("Enter Phone Number", text: $viewModel.phoneNumber)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            
            Text("Contact Privacy Settings")
                .font(.headline)
                .foregroundColor(.black)
            
            Picker(selection: $viewModel.privacySetting, label: Text("")) {
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
                viewModel.signUp()
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
