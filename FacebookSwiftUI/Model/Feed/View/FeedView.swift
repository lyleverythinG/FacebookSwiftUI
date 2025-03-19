//
//  FeedView.swift
//  FacebookSwiftUI
//
//  Created by Lyle Dane Carcedo on 3/5/25.
//
import SwiftUI

struct FeedView: View {
    private var facebookBlue: Color = Color(red: 26/555, green: 103/255, blue: 178/255)
    @StateObject private var viewModel = FeedViewModel()
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                ScrollView {
                    VStack {
                        HeaderView(viewModel: viewModel)
                        DividerView(width: proxy.size.width)
                        StoryFeedView(viewModel: viewModel)
                        DividerView(width: proxy.size.width)
                        ForEach(viewModel.posts) { post in
                            PostView(isVideo: false, post: post)
                            DividerView(width: proxy.size.width - 15)
                        }
                        
                        Spacer()
                    }
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Text("Facebook")
                                .font(.system(size: 32, weight: .bold))
                                .foregroundStyle(facebookBlue)
                        }
                        ToolbarItem(placement: .topBarTrailing) {
                            HStack(spacing: 24) {
                                Image(systemName: "plus.circle.fill")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 24, height: 24)
                                Image(systemName: "magnifyingglass")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 24, height: 24)
                                    .font(.system(size: 18, weight: .bold))
                                Image("messenger")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 24, height: 24)
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    FeedView()
}
