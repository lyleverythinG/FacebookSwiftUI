//
//  FriendsView.swift
//  FacebookSwiftUI
//
//  Created by Lyle Dane Carcedo on 3/8/25.
//

import SwiftUI

struct FriendsView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 25) {
                    // suggestionsa and your friends btn.
                    HStack {
                        TagView(title: "suggestions")
                        TagView(title: "Your friends")
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    Divider()
                    
                    // Friend requests and see all part.
                    HStack {
                        Text("Friends requests")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("3")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.red)
                        Spacer()
                        Button(action: {}, label: {
                            Text("See All")
                        })
                    }
                    .padding(.horizontal)
                    
                    // Friends list part.
                    ForEach(0..<3) { _ in
                        FriendsCell()
                    }
                    Spacer()
                }
                .padding(.vertical)
            }
            .scrollIndicators(.hidden)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Friends")
                        .font(.title)
                        .fontWeight(.bold)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "magnifyingglass")
                        .fontWeight(.bold)
                }
                
            }
        }
    }
}

#Preview {
    FriendsView()
}
