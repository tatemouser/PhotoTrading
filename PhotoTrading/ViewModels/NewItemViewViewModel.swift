////
////  NewItemViewViewModel.swift
////  PhotoTrading
////
////  Created by Tate Mouser on 9/4/23.
//// 2:16:37
//import FirebaseAuth
//import FirebaseFirestore
//import Foundation
//
//class NewItemViewViewModel: ObservableObject {
//    @Published var title = ""
//    @Published var dueDate = Date()
//    @Published var showAlert = false
//    
//    init() {}
//    
//    func save() {
//        guard canSave else {
//            return
//        }
//        // Get current user id
//        guard let uId = Auth.auth().currentUser?.uid else {
//            return
//        }
//
//        // Create model
//        let newItem = ToDoListItem(
//            id: UUID().uuidString,
//            title: title,
//            dueDate: dueDate.timeIntervalSince1970,
//            createdDate: Date().timeIntervalSince1970,
//            isDone: false)
//
//        // Save model to database
//        let db = Firestore.firestore()
//
//        db.collection("users")
//            .document(uId)
//            .collection("todos")
//            .addDocument(data: newItem.asDictionary()) { error in
//                if let error = error {
//                    // Handle the error here
//                    print("Error adding document: \(error)")
//                } else {
//                    // Document added successfully
//                    print("Document added successfully.")
//                }
//            }
//    }
//
//    
//    var canSave: Bool {
//        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
//            return false
//        }
//        
//        guard dueDate >= Date().addingTimeInterval(-86400) else {
//            return false
//        }
//        
//        return true
//    }
//}
