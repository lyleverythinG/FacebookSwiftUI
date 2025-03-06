//
//  ProfileFriendsView.swift
//  FacebookSwiftUI
//
//  Created by Lyle Dane Carcedo on 3/6/25.
//

import SwiftUI

struct ProfileFriendsView: View {
    private var gridItems: [GridItem] = [
        .init(.flexible(),  spacing: 1),
        .init(.flexible(),  spacing: 1),
        .init(.flexible(),  spacing: 1),
    ]
    private let width: CGFloat
    init(width: CGFloat) {
        self.width = width
    }
    
    var body: some View {
        VStack {
            HStack {
                // Friends
                VStack {
                    Text("Friends")
                        .font(.headline)
                        .fontWeight(.semibold)
                    Text("4 friends")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                }
                Spacer()
                
                // Find Friends
                Text("Find Friends")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.blue)
            }
            
            // List of friends cards.
            LazyVGrid(columns: gridItems) {
                ForEach(0 ..< 4) { _ in
                    VStack {
                        Image("profilePic1")
                            .resizable()
                            .scaledToFill()
                            .frame(width: (width / 3) - 20, height: (width / 3) - 20)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        Text("Jim Halpert")
                            .font(.headline)
                            .fontWeight(.semibold)
                    }
                }
            }
            
            // See all friends
            Text("See all friends")
                .font(.headline)
                .fontWeight(.semibold)
                .frame(width: width - 30, height: 44)
                .background(Color(.systemGray5))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.vertical)
                .foregroundStyle(Color(.darkGray))
        }
        .padding(.horizontal)
    }
}

#Preview {
    ProfileFriendsView(width: 400)
}
