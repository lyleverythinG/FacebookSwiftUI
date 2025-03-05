//
//  StoryCardView.swift
//  FacebookSwiftUI
//
//  Created by Lyle Dane Carcedo on 3/5/25.
//

import SwiftUI

struct StoryCardView: View {
    var body: some View {
        Image("Story1")
            .resizable()
            .scaledToFill()
            .frame(width: 100, height: 170)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .overlay {
                VStack(alignment: .leading) {
                    Image("profilePic1")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 35, height: 35)
                        .clipShape(Circle())
                        .overlay {
                            Circle().stroke(.blue, lineWidth: 3)
                        }
                    Spacer()
                    Text("Jim Halpert")
                        .foregroundStyle(.white)
                        .font(.system(size: 12, weight: .semibold))
                        .padding(.leading, 8)
                    HStack { Spacer() }
                }
                .padding(.leading, 8)
                .padding(.vertical, 8)
            }
    }
}

#Preview {
    StoryCardView()
}
