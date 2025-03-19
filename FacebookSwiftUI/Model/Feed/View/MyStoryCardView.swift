//
//  MyStoryCardView.swift
//  FacebookSwiftUI
//
//  Created by Lyle Dane Carcedo on 3/5/25.
//

import SwiftUI

struct MyStoryCardView: View {
    @StateObject private var viewModel: FeedViewModel
    init(viewModel: FeedViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(Color(.systemGray6))
                .frame(width: 100, height: 170)
            
            //TODO: Update this one later to display actual user.
            Image(viewModel.users[0].profileImageName ?? "")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 110)
                .clipShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 15, topTrailing: 15)))
            
            // Plus Icon
            VStack(spacing: 5) {
                Spacer()
                    .frame(height: 90)
                Image(systemName: "plus")
                    .padding(5)
                    .background(.blue)
                    .clipShape(Circle())
                    .foregroundStyle(.white)
                    .font(.system(size: 20, weight: .bold))
                    .overlay {
                        Circle()
                            .stroke(Color(.systemGray6), lineWidth: 3)
                    }
                VStack(spacing: 0) {
                    Text("Create")
                    Text("Story")
                }
                .font(.system(size: 12, weight: .bold))
            }
        }
        .padding(.leading)
    }
}

#Preview {
    MyStoryCardView(viewModel: FeedViewModel())
}
