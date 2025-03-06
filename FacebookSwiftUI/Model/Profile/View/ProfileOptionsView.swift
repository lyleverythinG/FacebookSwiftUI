//
//  ProfileOptionsView.swift
//  FacebookSwiftUI
//
//  Created by Lyle Dane Carcedo on 3/6/25.
//

import SwiftUI

struct ProfileOptionsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 24) {
                Text("Posts")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.blue)
                    .padding(.horizontal)
                    .padding(.vertical, 7)
                    .background(Color(.systemGray5))
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                Text("Photos")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color(.systemGray))
                Text("Reels")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color(.systemGray))
            }
            .padding(.horizontal)
            Divider()
        }
    }
}

#Preview {
    ProfileOptionsView()
}
