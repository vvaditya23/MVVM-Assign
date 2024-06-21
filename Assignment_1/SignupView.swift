//
//  FormList.swift
//  Assignment_1
//
//  Created by Aditya Vyavahare on 21/06/24.
//

import SwiftUI

struct SignupView: View {
    @State private var fullName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var phoneNumber: String = ""
    @State private var showNameToAll: Bool = true
    @State private var privacySetting: Int = 0

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Let's get to know each other 👋")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            TextField("Enter Full Name", text: $fullName)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            
            Toggle(isOn: $showNameToAll) {
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
            
            TextField("Enter Email", text: $email)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            
            SecureField("Enter Password", text: $password)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            
            TextField("Enter Phone Number", text: $phoneNumber)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            
            Text("Contact Privacy Settings")
                .font(.headline)
                .foregroundColor(.black)
            
            Picker(selection: $privacySetting, label: Text("")) {
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
                print("Next tapped")
            }) {
                Text("Next")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

#Preview {
    SignupView()
}
