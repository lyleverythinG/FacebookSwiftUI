//
//  MarketPlaceButton.swift
//  FacebookSwiftUI
//
//  Created by Lyle Dane Carcedo on 3/8/25.
//

import SwiftUI

struct MarketPlaceButton: View {
    private let title: String
    private let imageName: String
    private let width: CGFloat
    init(title: String, imageName: String, width: CGFloat) {
        self.title = title
        self.imageName = imageName
        self.width = width
    }
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
            Text(title)
                .font(.headline)
                .fontWeight(.semibold)
        }
        .frame(width: width * 0.45, height: 44)
        .background(Color(.systemGray5))
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}

#Preview {
    MarketPlaceButton(title: "test", imageName: "pin", width: 400)
}
