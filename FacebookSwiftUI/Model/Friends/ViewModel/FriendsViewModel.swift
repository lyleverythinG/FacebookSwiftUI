//
//  FriendsViewModel.swift
//  FacebookSwiftUI
//
//  Created by Lyle Dane Carcedo on 3/8/25.
//

import Foundation

class FriendsViewModel: ObservableObject {
    
    @Published var users: [User] = [
        .init(id: "0", firstName: "Juan", familyName: "Dela Cruz", email: "test@gmail.com",profileImageName: "juanDelaProfilePic", age: 26, gender: "male", friendsId: ["3"], friendsRequestsIds: ["1","2","4"], isCurrentUser: true),
        .init(id: "1", firstName: "Lebron", familyName: "James", email: "james@gmail.com",profileImageName: "lebron", age: 36, gender: "male", friendsId: [], friendsRequestsIds: [], isCurrentUser: false),
        .init(id: "2", firstName: "Derrick", familyName: "Rose", email: "rose@gmail.com",profileImageName: "derrick", age: 22, gender: "male", friendsId: [], friendsRequestsIds: [], isCurrentUser: false),
        .init(id: "3", firstName: "Taylor", familyName: "Swift", email: "swift@gmail.com",profileImageName: "taylor", age: 34, gender: "female", friendsId: ["0"], friendsRequestsIds: [], isCurrentUser: false),
        .init(id: "4", firstName: "Bea", familyName: "Alonzo", email: "alonzo@gmail.com",profileImageName: "bea", age: 38, gender: "female", friendsId: [], friendsRequestsIds: [], isCurrentUser: false),
    ]
    
    @Published var friendRequests: [User] = []
    
    init() {
        setupFriendsRequests()
    }
    
    private func setupFriendsRequests() {
        self.friendRequests = self.users.filter { self.users[0].friendsRequestsIds.contains($0.id)}
    }
}
