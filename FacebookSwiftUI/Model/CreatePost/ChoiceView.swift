//
//  ChoiceView.swift
//  FacebookSwiftUI
//
//  Created by Lyle Dane Carcedo on 3/8/25.
//

import SwiftUI

struct ChoiceView: View {
    private var imageName: String
    private var title: String
    init(imageName: String, title: String) {
        self.imageName = imageName
        self.title = title
    }
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: imageName)
                .frame(width: 14, height: 12)
            Text(title)
            Text("▼")
                .font(.caption2)
        }
        .foregroundStyle(.blue)
        .font(.subheadline)
        .fontWeight(.bold)
        .padding(.horizontal)
        .padding(.vertical, 5)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    ChoiceView(imageName: "plus", title: "Friends")
}
