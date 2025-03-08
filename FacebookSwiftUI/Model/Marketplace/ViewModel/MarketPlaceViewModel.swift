//
//  MarketplaceViewModel.swift
//  FacebookSwiftUI
//
//  Created by Lyle Dane Carcedo on 3/8/25.
//

import Foundation

class MarketPlaceViewModel: ObservableObject {
    
    @Published var items: [Item] = [
        .init(id: UUID().uuidString, itemName: "1 bed 1 bathroom", itemPrice: 950, imageName: "apartment1"),
        .init(id: UUID().uuidString, itemName: "1 bed 1 bath flat", itemPrice: 800, imageName: "apartment2"),
        .init(id: UUID().uuidString, itemName: "2015 BMW", itemPrice: 2600, imageName: "car1"),
        .init(id: UUID().uuidString, itemName: "2020 Mercedes", itemPrice: 44, imageName: "car2"),
        .init(id: UUID().uuidString, itemName: "corner sofa", itemPrice: 80, imageName: "sofa1"),
        .init(id: UUID().uuidString, itemName: "corner sofa", itemPrice: 86, imageName: "sofa2"),
    ]
}

