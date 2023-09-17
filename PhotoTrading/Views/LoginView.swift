////
////  LoginView.swift
////  PhotoTrading
////
////  Created by Tate Mouser on 9/4/23.
////
//
//import SwiftUI
//
//struct LoginView: View {
//    @StateObject var viewModel = LoginViewViewModel()
//    
//    var body: some View {
//        NavigationView {
//            VStack {
//                // Header
//                HeaderView(title: "Gatekeep",
//                           subtitle: "Trade Now",
//                           angle: 15,
//                           background: Color("Orange1"))
//                
//                
//                // Login Form
//                Form {
//                    if !viewModel.errorMessage.isEmpty {
//                        Text(viewModel.errorMessage)
//                            .foregroundColor(Color.red)
//                    }
//                    
//                    TextField("Email Address", text: $viewModel.email)
//                        .textFieldStyle(DefaultTextFieldStyle())
//                        .autocapitalization(.none)
//                    
//                    SecureField("Password", text: $viewModel.password)
//                        .textFieldStyle(DefaultTextFieldStyle())
//                    
//                    
//                    TLButton(
//                        title: "Log In",
//                        background: Color("DarkBlue1")
//                    ) {
//                        viewModel.login()
//                    }
//                    .padding()
//                }
//                .offset(y: -50)
//                .scrollContentBackground(.hidden)
//                
//                // Create Account
//                VStack {
//                    Text("New around here?").foregroundColor(.white)
//
//                    NavigationLink("Create An Account",
//                                   destination: RegisterView())
//                    .foregroundColor(Color("DarkBlue1"))
//                    
//                }
//                //.padding(.bottom, 50)
//                .padding(.bottom, 75)
//                Spacer()
//                    
//            }
//            .background(Color("MedBlue1"))
//        }
//    }
//}
//
//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}
