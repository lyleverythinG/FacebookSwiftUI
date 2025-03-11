//
//  StoryFeedView.swift
//  FacebookSwiftUI
//
//  Created by Lyle Dane Carcedo on 3/5/25.
//

import SwiftUI

struct StoryFeedView: View {
    @StateObject private var viewModel: FeedViewModel
    init(viewModel: FeedViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                // Story card
                MyStoryCardView(viewModel: viewModel)
                ForEach(viewModel.friends) { friend in
                    StoryCardView(friend: friend)
                }
            }
        }
        .scrollIndicators(.hidden)
        .padding(.vertical, 5)
    }
}

#Preview {
    StoryFeedView(viewModel: FeedViewModel())
}
