//
//  User.swift
//  FacebookSwiftUI
//
//  Created by Lyle Dane Carcedo on 3/8/25.
//

struct User: Identifiable, Hashable, Codable {
    let id: String
    var firstName: String
    var familyName: String
    var email: String
    var profileImageName: String?
    var coverImageName: String?
    var age: Int
    let gender: String
    var friendsId: [String]
    var friendsRequestsIds: [String]
    var isCurrentUser: Bool
}
