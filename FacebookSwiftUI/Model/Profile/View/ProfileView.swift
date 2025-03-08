//
//  ProfileView.swift
//  FacebookSwiftUI
//
//  Created by Lyle Dane Carcedo on 3/5/25.
//

import SwiftUI


struct ProfileView: View {
    @Environment(\.dismiss) private var dismiss
    private var facebookBlue: Color = Color(red: 26/555, green: 103/255, blue: 178/255)
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                VStack {
                    ProfileHeaderView(width: proxy.size.width)
                    DividerView(width: proxy.size.width)
                    ProfileOptionsView()
                    ProfileFriendsView(width: proxy.size.width)
                    DividerView(width: proxy.size.width)
                    ProfilePostsView(width: proxy.size.width)
                    ForEach(0 ..< 2) { _ in
                        PostView(isVideo: false)
                    }
                }
            }
            .scrollIndicators(.hidden)
            .navigationTitle("Juan Dela Cruz")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "arrow.left")
                            .foregroundStyle(.black)
                            .fontWeight(.bold)
                    })
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {}, label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.black)
                            .fontWeight(.bold)
                    })
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
