////
////  RegisterView.swift
////  PhotoTrading
////
////  Created by Tate Mouser on 9/4/23.
////
//
//import SwiftUI
//
//struct RegisterView: View {
//    @StateObject var viewModel = RegisterViewViewModel()
//
//    var body: some View {
//        VStack {
//            // Header
//            HeaderView(title: "Register",
//                       subtitle: "Start organizing todos",
//                       angle: -15,
//                       background: Color("Yellow1"))
//            
//            Form {
//                TextField("Full Name", text: $viewModel.name)
//                    .textFieldStyle(DefaultTextFieldStyle())
//                    .autocorrectionDisabled()
//                TextField("Email Address", text: $viewModel.email)
//                    .textFieldStyle(DefaultTextFieldStyle())
//                    .autocapitalization(.none)
//                    .autocorrectionDisabled()
//                SecureField("Password", text: $viewModel.password)
//                    .textFieldStyle(DefaultTextFieldStyle())
//
//                TLButton(
//                    title: "Create Account",
//                    background: Color("DarkBlue1")
//                ) {
//                    viewModel.register()
//                }
//                .padding()
//            }
//            .offset(y: -50)
//
//            Spacer()
//        }
//    }
//}
//
//struct RegisterView_Previews: PreviewProvider {
//    static var previews: some View {
//        RegisterView()
//    }
//}