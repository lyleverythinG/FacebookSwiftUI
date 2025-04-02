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
    
    init() {
        Task {try await fetchCurrentUser() }
    }
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        self.currentUser = try snapshot.data(as: User.self)
    }
    
    func reset() {
        self.currentUser = nil
    }
    
    @MainActor
    func updateProfileImage(withImageurl imageUrl: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        try await Firestore.firestore().collection("users").document(uid).updateData([
            "profileImageName" : imageUrl
        ])
        self.currentUser?.profileImageName = imageUrl
    }
    
    @MainActor
    func updateCoverImage(withImageurl imageUrl: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        try await Firestore.firestore().collection("users").document(uid).updateData([
            "coverImageName" : imageUrl
        ])
        self.currentUser?.coverImageName = imageUrl
    }
}
