//
//  SignUpView.swift
//  WalletApp
//
//  Created by Sameera Shah on 2/14/24.
//

import SwiftUI

struct SignUpView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var errorMessage: String?
    @State private var signUpSuccessful: Bool = false
    
    // Arrays to hold user data
    @State var firstNames: [String] = []
    @State var lastNames: [String] = []
    @State var usernames: [String] = []
    @State var passwords: [String] = []
    
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Sign Up")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.blue)
            
            HStack{
                TextField("First Name", text: $firstName)
                    .padding()
                    .background(Color(UIColor.systemGray5))
                    .cornerRadius(8)
                    .autocorrectionDisabled()
                
                TextField("Last Name", text: $lastName)
                    .padding()
                    .background(Color(UIColor.systemGray5))
                    .cornerRadius(8)
                    .autocorrectionDisabled()
            }
            
            TextField("Username", text: $username)
                .padding()
                .background(Color(UIColor.systemGray5))
                .cornerRadius(8)
                .autocorrectionDisabled()

            SecureField("Password", text: $password)
                .padding()
                .background(Color(UIColor.systemGray5))
                .cornerRadius(8)
                .autocorrectionDisabled()
            
            SecureField("Confirm Password", text: $confirmPassword)
                .padding()
                .background(Color(UIColor.systemGray5))
                .cornerRadius(8)
                .autocorrectionDisabled()
            
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            }
            Button(action: signUp) {
                Text("Sign Up")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(8)
                
            }

            NavigationLink(
                destination: ContentView(usernames: $usernames, passwords: $passwords, firstNames: $firstNames, lastNames: $lastNames),
                isActive: $signUpSuccessful,
                label: { EmptyView() }
            )
            .hidden()

        }
        .padding()
//        .alert(isPresented: $signUpSuccessful) {
//            Alert(
//                title: Text("Sign Up Successful!"),
//                message: Text("Your account has been created successfully."),
//                dismissButton: .default(Text("OK"))
//            )
//            
//        }
    }
    
    func signUp() {
        if username.isEmpty || password.isEmpty || confirmPassword.isEmpty {
            errorMessage = "Please fill in all fields."
            return
        }
        
        if password != confirmPassword {
            errorMessage = "Passwords do not match."
            return
        }
        
        if usernames.contains(username) {
                    errorMessage = "Username already exists. Please choose a different one."
                    return
                }
                
            firstNames.append(firstName)
            lastNames.append(lastName)
            usernames.append(username)
            passwords.append(password)

            errorMessage = nil
            signUpSuccessful = true
            firstName = ""
            lastName = ""
            username = ""
            password = ""
            confirmPassword = ""
        
    }
}


#Preview {
    SignUpView()
}
