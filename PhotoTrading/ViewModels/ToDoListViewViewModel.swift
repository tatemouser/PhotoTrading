////
////  ToDoListViewViewModel.swift
////  PhotoTrading
////
////  Created by Tate Mouser on 9/4/23.
////
//import FirebaseFirestore
//import Foundation
//
///// View Model for list of items view
///// Primary tab
//class ToDoListViewViewModel: ObservableObject {
//    @Published var showingNewItemView = false
//    
//    private let userId: String
//    
//    init(userId: String) {
//        self.userId = userId
//    }
//    /// Delete to do list item
//    ///  Paramter id: Item id to delete
//    func delete(id: String) {
//        let db = Firestore.firestore()
//        
//        db.collection("users")
//            .document(userId)
//            .collection("todos")
//            .document(id)
//            .delete()
//    }
//}
