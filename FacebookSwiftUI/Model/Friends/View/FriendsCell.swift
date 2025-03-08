//
//  FriendsCell.swift
//  FacebookSwiftUI
//
//  Created by Lyle Dane Carcedo on 3/8/25.
//

import SwiftUI

struct FriendsCell: View {
    private var user: User
    
    init(user: User) {
        self.user = user
    }
    
    var body: some View {
        HStack(alignment: .top) {
            // Profile picture
            Image(user.profileImageName ?? "")
                .resizable()
                .scaledToFill()
                .frame(width: 70, height: 70)
                .clipShape(Circle())
            
            // Friend name and confirm, delete btns.
            VStack(alignment: .leading) {
                Text("\(user.firstName) \(user.familyName)")
                    .font(.headline)
                    .fontWeight(.semibold)
                HStack {
                    // Confirm button
                    Button {
                        
                    } label: {
                        Text("Confirm")
                            .foregroundStyle(.white)
                            .frame(width: 120, height: 32)
                            .background(.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                    
                    // Delete button
                    Button {
                        
                    } label: {
                        Text("Delete")
                            .foregroundStyle(.black)
                            .frame(width: 120, height: 32)
                            .background(Color(.systemGray5))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    FriendsCell(user: User(id: "0", firstName: "Juan Dela", familyName: "Cruz", email: "cruz@gmail.com", age: 28, gender: "male", friendsId: [], friendsRequestsIds: [], isCurrentUser: true))
}
