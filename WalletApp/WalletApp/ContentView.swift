//
//  ContentView.swift
//  WalletApp
//
//  Created by Sameera Shah on 2/14/24.
//

import SwiftUI

struct ContentView: View {

    @State var password: String = ""
    @State var username: String = ""
    @State var errorMessage = ""
    @State var isTrue = false
    
    @Binding var usernames: [String]
    @Binding var passwords: [String]
    @Binding var firstNames: [String]
    @Binding var lastNames: [String]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Log in to Access Your Wallet")
                    .font(.title2)
                    .foregroundColor(.blue)
                    .multilineTextAlignment(.center)
                
                HStack {
                    Text("Username:")
                        .font(.headline)
                    TextField("Enter your username", text: $username)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .autocorrectionDisabled()
                }
                
                HStack {
                    Text("Password: ")
                        .font(.headline)
                    SecureField("Enter your password", text: $password)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                }
                
                Button(action: {
                    
                    if username.isEmpty || password.isEmpty {
                        errorMessage = "Please enter both username and password"
                        return
                    }
                    
                        for index in 0..<usernames.count {
                            if (username == usernames[index]) && (password == passwords[index]) {
                                isTrue = true
                                return
                            }
                        }
                   
                        errorMessage = "Cannot log in"

                }) {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                NavigationLink(
                    destination: TestView(),
                    isActive: $isTrue,
                    label: { EmptyView() }
                )
                .hidden()

                
                NavigationLink("New? Sign up now", destination: SignUpView())
                    .padding()
                
                if !errorMessage.isEmpty {
                        Text(errorMessage)
                            .foregroundColor(.red)
                }
            }
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}


#Preview {
    ContentView(usernames: .constant([""]), passwords: .constant([""]), firstNames: .constant([""]), lastNames: .constant([""]))
}
