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
    @Published var friends: [User]?
    static let shared = UserService()
    
    init() {
        Task {try await fetchCurrentUser() }
    }
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        self.currentUser = try snapshot.data(as: User.self)
        try await fetchFriends()
    }
    
    func reset() {
        self.currentUser = nil
        self.friends = nil
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
    
    @MainActor
    func fetchFriends() async throws {
        let snapshot  =  try await Firestore.firestore().collection("users").getDocuments()
        let users = snapshot.documents.compactMap({try? $0.data(as: User.self)})
        guard let friendsIds = self.currentUser?.friendsId else { return }
        self.friends = users.filter({ friendsIds.contains($0.id)})
    }
}
