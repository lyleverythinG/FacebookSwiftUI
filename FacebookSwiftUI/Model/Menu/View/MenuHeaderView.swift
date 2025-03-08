//
//  MenuHeaderView.swift
//  FacebookSwiftUI
//
//  Created by Lyle Dane Carcedo on 3/8/25.
//

import SwiftUI

struct MenuHeaderView: View {
    var body: some View {
        VStack {
            // Profile picture, name, and arrow down.
            HStack(spacing: 15) {
                Image("juanDelaProfilePic")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                Text("Juan Dela Cruz")
                Spacer()
                Image(systemName: "chevron.down.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 24, height: 24)
                    .foregroundStyle(Color(.systemGray3))
            }
            
            Divider()
            
            // Create another profile row.
            HStack(spacing: 15) {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 30, height: 30)
                Text("Create another profile")
                Spacer()
            }
            .foregroundStyle(Color(.darkGray))
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding()
    }
}

#Preview {
    MenuHeaderView()
}
