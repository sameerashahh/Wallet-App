//
//  LoginView.swift
//  WalletApp
//
//  Created by Sameera Shah on 2/14/24.
//
//
//import SwiftUI
//
//struct LoginView: View {
//    
//    @State var password: String = ""
//    @State var username: String = ""
//    @State var errorMessage = ""
//    
//    @Binding var usernames: [String]
//    @Binding var passwords: [String]
//    @Binding var firstNames: [String]
//    @Binding var lastNames: [String]
//        
//    
//    var body: some View {
//        NavigationView{
//            
//            VStack(spacing: 20) {
//                Text("Log in to Access Your Wallet")
//                    .font(.title2)
//                    .foregroundColor(.blue)
//                    .multilineTextAlignment(.center)
//                
//                HStack {
//                    Text("Username:")
//                        .font(.headline)
//                    TextField("Enter your username", text: $username)
//                        .padding()
//                        .background(Color.white)
//                        .cornerRadius(8)
//                        .autocorrectionDisabled()
//                }
//                
//                HStack {
//                    Text("Password: ")
//                        .font(.headline)
//                    SecureField("Enter your password", text: $password)
//                        .padding()
//                        .background(Color.white)
//                        .cornerRadius(8)
//                }
//                
//                Button(action: login) {
//                    Text("Login")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .frame(maxWidth: .infinity)
//                        .padding()
//                        .background(Color.blue)
//                        .cornerRadius(10)
//                }
//                
//                NavigationLink("New? Sign up now", destination: SignUpView())
//                    .padding()
//                
//                if !errorMessage.isEmpty {
//                        Text(errorMessage)
//                            .foregroundColor(.red)
//                }
//            }
//            .padding()
//            .textFieldStyle(RoundedBorderTextFieldStyle())
//        }
//        
//    }
//    func login() {
//            guard !username.isEmpty && !password.isEmpty else {
//                errorMessage = "Please enter both username and password"
//                return
//            }
//            
//            if let index = usernames.firstIndex(of: username) {
//                if passwords.indices.contains(index) && passwords[index] == password {
//                    // Successful login
//                    print("Logged in as \(username)")
//                    errorMessage = ""
//                } else {
//                    errorMessage = "Invalid username or password"
//                }
//            } else {
//                errorMessage = "Username not found"
//            }
//        }
//}




