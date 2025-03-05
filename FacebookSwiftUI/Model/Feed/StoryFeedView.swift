//
//  StoryFeedView.swift
//  FacebookSwiftUI
//
//  Created by Lyle Dane Carcedo on 3/5/25.
//

import SwiftUI

struct StoryFeedView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                // Story card
                MyStoryCardView()
                ForEach(0 ..< 3) {_ in
                    StoryCardView()
                }
            }
        }
        .scrollIndicators(.hidden)
        .padding(.vertical, 5)
    }
}

#Preview {
    StoryFeedView()
}
