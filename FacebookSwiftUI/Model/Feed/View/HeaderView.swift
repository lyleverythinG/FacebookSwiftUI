//
//  HeaderView.swift
//  FacebookSwiftUI
//
//  Created by Lyle Dane Carcedo on 3/5/25.
//

import SwiftUI

struct HeaderView: View {
    @State private var showCreatePost: Bool = false
    @StateObject private var viewModel: FeedViewModel
    init(viewModel: FeedViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        HStack {
            NavigationLink {
                ProfileView(viewModel: viewModel)
                    .navigationBarBackButtonHidden()
            } label: {
                //TODO: Update this one later to display actual user.
                // Circular Profile Image
                Image(viewModel.users[0].profileImageName ?? "")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
            }
            Button(action: {
                showCreatePost.toggle()
            }, label: {
                // What's on your mind field
                HStack {
                    Text("What's on your mind?")
                        .foregroundStyle(.black)
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.vertical, 10)
                .overlay {
                    Capsule()
                        .stroke(Color(.systemGray4), lineWidth: 1)
                }
                .padding(.leading, 5)
                .padding(.trailing, 15)
            })
            
            // Image File Icon
            Image(systemName: "photo.on.rectangle.angled")
                .resizable()
                .scaledToFill()
                .frame(width: 20, height: 20)
                .foregroundStyle(.green)
        }
        .padding(.horizontal)
        .padding(.top, 30)
        .padding(.bottom)
        .fullScreenCover(isPresented: $showCreatePost, content: {
            CreatePostView()
        })
    }
}

#Preview {
    HeaderView(viewModel: FeedViewModel())
}
