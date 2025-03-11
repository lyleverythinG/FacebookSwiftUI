//
//  ProfileHeaderView.swift
//  FacebookSwiftUI
//
//  Created by Lyle Dane Carcedo on 3/5/25.
//

import SwiftUI

struct ProfileHeaderView: View {
    private var width: CGFloat
    @StateObject private var viewModel: FeedViewModel
    init(width: CGFloat, viewModel: FeedViewModel) {
        self.width = width
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            // Cover photo section.
            Image(viewModel.users[0].coverImageName ?? "")
                .resizable()
                .scaledToFill()
                .frame(width: width, height: 250)
            
            Color.white
                .frame(height: 180)
        }
        .overlay {
            // Profile picture section.
            VStack(alignment: .leading) {
                Image(viewModel.users[0].profileImageName ?? "")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .stroke(Color(.systemGray6), lineWidth: 3)
                    }
                    .padding(.top, 170)
                
                // Profile Name
                Text("\(viewModel.users[0].firstName) \(viewModel.users[0].familyName)")
                    .font(.title)
                    .fontWeight(.bold)
                
                // Number of friends
                Text("\(viewModel.friends.count)")
                    .font(.headline) +
                Text("Friends")
                    .font(.headline)
                    .foregroundStyle(.gray)
                
                // Profile action buttons (add to story, edit, more...)
                HStack {
                    CustomButton(imageName: "plus", title: "Add to story", backgroundColor: .blue, foregroundColor: .white)
                    CustomButton(imageName: "pencil", title: "Edit profile", backgroundColor: Color(.systemGray5), foregroundColor: Color(.darkGray))
                    CustomButton(imageName: "ellipsis", title: "", backgroundColor: Color(.systemGray5), foregroundColor: Color(.darkGray))
                }
                HStack { Spacer() }
            }
            .padding(.horizontal)
        }
    }
}
