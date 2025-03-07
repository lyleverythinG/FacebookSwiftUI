//
//  PostActionButton.swift
//  FacebookSwiftUI
//
//  Created by Lyle Dane Carcedo on 3/6/25.
//

import SwiftUI

struct PostActionButton: View {
    private var title: String
    private var imageName: String
    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
    }
    
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 16, height: 16)
                .foregroundStyle(.red)
            Text(title)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundStyle(Color(.darkGray))
        }
        .padding(.horizontal, 25)
        .padding(.vertical, 8)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}

#Preview {
    PostActionButton(title: "Reel", imageName: "play.rectangle.fill")
}
