//
//  VideoOptionView.swift
//  FacebookSwiftUI
//
//  Created by Lyle Dane Carcedo on 3/8/25.
//

import SwiftUI

struct VideoOptionsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(.horizontal) {
                HStack(spacing: 24) {
                    Text(" For you")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.blue)
                        .padding(.horizontal)
                        .padding(.vertical, 7)
                        .background(Color(.systemGray5))
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                    Text("Live")
                        .videoOptionViewModifier()
                    Text("Gaming")
                        .videoOptionViewModifier()
                    Text("Reels")
                        .videoOptionViewModifier()
                    Text("Following")
                        .videoOptionViewModifier()
                }
            }
            .padding(.leading)
            Divider()
        }
        .padding(.vertical)
    }
}

#Preview {
    VideoOptionsView()
}
