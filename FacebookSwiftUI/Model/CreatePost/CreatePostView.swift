//
//  CreatePostView.swift
//  FacebookSwiftUI
//
//  Created by Lyle Dane Carcedo on 3/8/25.
//

import SwiftUI

struct CreatePostView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var mindText = ""
    var body: some View {
        NavigationStack {
            VStack(alignment:  .leading) {
                Divider()
                HStack(alignment: .top) {
                    Image("juanDelaProfilePic")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 45, height: 45)
                        .clipShape(Circle())
                    
                    // Name + buttons (friends, album, camera)
                    VStack(alignment: .leading) {
                        Text("Juan Dela Cruz")
                        HStack {
                            ChoiceView(imageName: "person.2.fill", title: "Friends")
                            ChoiceView(imageName: "", title: "Album")
                        }
                        ChoiceView(imageName: "camera", title: "Off")
                    }
                    .padding(.horizontal)
                }
                .padding()
                
                // Text field
                TextField("What's on your mind", text: $mindText, axis: .vertical)
                    .padding(.horizontal)
                Spacer()
                Divider()
                
                // Buttons located below or footer part.
                HStack {
                    Spacer()
                    Button(action: {}, label: {
                        Image(systemName: "photo.fill.on.rectangle.fill")
                            .foregroundStyle(.green)
                    })
                    Spacer()
                    Button(action: {}, label: {
                        Image(systemName: "person.fill")
                            .foregroundStyle(.blue)
                    })
                    Spacer()
                    Button(action: {}, label: {
                        Image(systemName: "face.smiling")
                            .foregroundStyle(.yellow)
                    })
                    Spacer()
                    Button(action: {}, label: {
                        Image("pin")
                            .resizable()
                            .frame(width: 18, height: 18)
                            .foregroundStyle(.red)
                    })
                    Spacer()
                    Button(action: {}, label: {
                        Image(systemName: "ellipsis.circle.fill")
                            .foregroundStyle(Color(.darkGray))
                    })
                    Spacer()
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    HStack {
                        Button(action: {
                            dismiss()
                        }, label: {
                            Image(systemName: "arrow.left")
                                .foregroundStyle(.black)
                                .fontWeight(.bold)
                        })
                        Text("Create Post")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    HStack {
                        Button(action: {}, label: {
                            Text("Post")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .frame(width: 80, height: 35)
                                .foregroundStyle(mindText.count == 0 ? Color(.darkGray): .white)
                                .background(mindText.count == 0 ? Color(.systemGray5) : .blue)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        })
                        .disabled(mindText.count == 0)
                    }
                }
            }
        }
    }
}

#Preview {
    CreatePostView()
}
