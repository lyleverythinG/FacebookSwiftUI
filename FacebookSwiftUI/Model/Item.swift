//
//  Item.swift
//  FacebookSwiftUI
//
//  Created by Lyle Dane Carcedo on 3/8/25.
//

import SwiftUI

struct Item: Identifiable, Hashable, Codable {
    let id: String
    //NOTE: avoid snake case if possible.
    var itemName: String
    var itemPrice: Int
    var imageName: String
}
