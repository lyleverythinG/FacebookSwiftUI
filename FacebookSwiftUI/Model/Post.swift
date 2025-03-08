//
//  Post.swift
//  FacebookSwiftUI
//
//  Created by Lyle Dane Carcedo on 3/8/25.
//

import SwiftUI

struct Post: Identifiable, Hashable, Codable {
    let id: String
    //NOTE: In real word scenario or production, userId is enough.
    let userId: String
    var postTitle: String
    var postLikes: Int
    var postShares: Int
    var postUrl: String
    var isVideo: Bool
    // let timestamp: CVTimeStamp
    // NOTE: For now, lets add this.
    var user: User?
}
