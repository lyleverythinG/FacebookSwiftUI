//
//  FeedViewModel.swift
//  FacebookSwiftUI
//
//  Created by Lyle Dane Carcedo on 3/11/25.
//

import SwiftUI
import PhotosUI

class FeedViewModel: ObservableObject {
    @Published var users: [User] = [
        .init(id: "0", firstName: "Juan", familyName: "Dela Cruz", email: "test@gmail.com",profileImageName: "juanDelaProfilePic", coverImageName: "cover_picture", age: 26, gender: "male", friendsId: ["3","5","6","7"], friendsRequestsIds: ["1","2","4"], isCurrentUser: true),
        .init(id: "1", firstName: "Lebron", familyName: "James", email: "james@gmail.com",profileImageName: "lebron", age: 36, gender: "male", friendsId: [], friendsRequestsIds: [], isCurrentUser: false),
        .init(id: "2", firstName: "Derrick", familyName: "Rose", email: "rose@gmail.com",profileImageName: "derrick", age: 22, gender: "male", friendsId: [], friendsRequestsIds: [], isCurrentUser: false),
        .init(id: "3", firstName: "Taylor", familyName: "Swift", email: "swift@gmail.com",profileImageName: "taylor", coverImageName: "cover_picture", age: 34, gender: "female", friendsId: ["0"], friendsRequestsIds: [], isCurrentUser: false),
        .init(id: "4", firstName: "Bea", familyName: "Alonzo", email: "alonzo@gmail.com",profileImageName: "bea", age: 38, gender: "female", friendsId: [], friendsRequestsIds: [], isCurrentUser: false),
        .init(id: "5", firstName: "Elizabeth", familyName: "Olsen", email: "elizabeth@gmail.com", profileImageName: "profilePic2", coverImageName: "Story2", age: 38, gender: "female", friendsId: ["0"], friendsRequestsIds: [], isCurrentUser: false),
        .init(id: "6", firstName: "Thomas", familyName: "Shelby", email: "shelby@gmail.com", profileImageName: "profilePic3", coverImageName: "Story3", age: 45, gender: "male", friendsId: ["0"], friendsRequestsIds: [], isCurrentUser: false),
        .init(id: "7", firstName: "Nancy", familyName: "Wheeler", email: "nancy@gmail.com", profileImageName: "profilePic4", coverImageName: "Story4", age: 26, gender: "female", friendsId: ["0"], friendsRequestsIds: [], isCurrentUser: false),
    ]
    
    @Published var friends: [User] = []
    
    @Published var posts: [Post] = [
        .init(id: "0", userId: "3", postTitle: "Best team ever", postLikes: 2, postShares: 2, postUrl: "office", isVideo: false),
        .init(id: "1", userId: "0", postTitle: "You'll never walk alone", postLikes: 3, postShares: 4, postUrl: "stadium", isVideo: false),
    ]
    
    @Published var myPostIndexes: [Int] = []
    @Published var selectedImg: PhotosPickerItem? {
        didSet {
            Task { try await loadImage(fromItem: selectedImg!)}
        }
    }
    
    @Published var selectedCoverImg: PhotosPickerItem? {
        didSet {
            Task { try await loadCoverImg(fromItem: selectedCoverImg!)}
        }
    }
    
    @Published var profileImg: Image = Image("no_profile")
    @Published var coverImg: Image = Image("no_profile")
    
    private var uiImage: UIImage?
    
    init() {
        setupFriends()
        setupPosts()
    }
    
    private func setupFriends() {
        self.friends = self.users.filter { self.users[0].friendsId.contains($0.id)}
    }
    
    private func setupPosts() {
        for index in 0 ..< posts.count {
            posts[index].user = users.first(where: {$0.id == posts[index].userId})
            if posts[index].user == users[0] {
                myPostIndexes.append(index)
            }
        }
    }
    
    @MainActor
    func loadImage(fromItem item: PhotosPickerItem?) async throws {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.profileImg = Image(uiImage: uiImage)
    }
    
    @MainActor
    func loadCoverImg(fromItem item: PhotosPickerItem?) async throws {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.coverImg = Image(uiImage: uiImage)
    }
}
