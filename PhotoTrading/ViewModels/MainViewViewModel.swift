////
////  MainViewViewModel.swift
////  PhotoTrading
////
////  Created by Tate Mouser on 9/4/23.
////
//import FirebaseAuth
//import Foundation
//
//class MainViewViewModel: ObservableObject {
//    // Updates view as user login and logout
//    @Published var currentUserId: String = ""
//    private var handler: AuthStateDidChangeListenerHandle?
//    
//    init() {
//        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
//            DispatchQueue.main.async {
//                self?.currentUserId = user?.uid ?? ""
//            }
//        }
//    }
//    
//    public var isSignedIn: Bool {
//        return Auth.auth().currentUser != nil
//    }
//}
