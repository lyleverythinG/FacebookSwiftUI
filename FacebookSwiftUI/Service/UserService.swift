//
//  UserService.swift
//  FacebookSwiftUI
//
//  Created by Lyle Dane Carcedo on 3/21/25.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

class UserService {
    
    @Published var currentUser: User?
    static let shared = UserService()
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        self.currentUser = try snapshot.data(as: User.self)
    }
    
    func reset() {
        self.currentUser = nil
    }
}
