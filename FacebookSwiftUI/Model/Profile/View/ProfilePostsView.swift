//
//  ManageProfilePostsView.swift
//  FacebookSwiftUI
//
//  Created by Lyle Dane Carcedo on 3/6/25.
//

import SwiftUI

struct ProfilePostsView: View {
    private var width: CGFloat
    init(width: CGFloat) {
        self.width = width
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Posts")
                    .font(.headline)
                    .fontWeight(.semibold)
                Spacer()
                Text("Filters")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.blue)
            }
            .padding(.horizontal)
            
            // What's on your mind section.
            HStack(spacing: 16) {
                Image("profilePic")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                Text("What's on your mind?")
                Spacer()
                Image(systemName: "photo.on.rectangle.angled")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.green)
            }
            .padding(.horizontal)
            Color(.systemGray6)
                .frame(height: 70)
                .overlay {
                    // Reel and live action buttons.
                    HStack {
                        PostActionButton(title: "Reel", imageName: "play.rectangle.fill")
                        PostActionButton(title: "Live", imageName: "video.fill")
                        Spacer()
                    }
                    .padding(.horizontal)
                }
            
            // Manage posts button
            Button(action: {}) {
                HStack(spacing: 10) {
                    Spacer()
                    Image(systemName: "text.bubble.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 16, height: 16)
                    Text("Manage posts")
                        .font(.headline)
                        .fontWeight(.semibold)
                    Spacer()
                }
                .foregroundStyle(Color(.darkGray))
                .frame(width: width - 30, height: 44)
                .background(Color(.systemGray5))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.vertical)
            }
            
            DividerView(width: width)
        }
    }
}

#Preview {
    ProfilePostsView(width: 400)
}
