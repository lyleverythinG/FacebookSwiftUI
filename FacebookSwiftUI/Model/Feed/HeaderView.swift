//
//  HeaderView.swift
//  FacebookSwiftUI
//
//  Created by Lyle Dane Carcedo on 3/5/25.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            NavigationLink {
                ProfileView()
            } label: {
                // Circular Profile Image
                Image("juanDelaProfilePic")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
            }
            Button(action: {}, label: {
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
        .padding(.vertical, 30)
    }
}


#Preview {
    HeaderView()
}
