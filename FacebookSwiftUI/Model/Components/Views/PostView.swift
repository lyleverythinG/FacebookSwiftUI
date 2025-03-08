//
//  PostView.swift
//  FacebookSwiftUI
//
//  Created by Lyle Dane Carcedo on 3/5/25.
//

import SwiftUI
import AVKit

struct PostView: View {
    private var facebookBlue: Color = Color(red: 26/555, green: 103/255, blue: 178/255)
    private var isVideo: Bool
    init(isVideo: Bool) {
        self.isVideo = isVideo
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            // Consist of profile picture + name + time of post and suffix icons (... and x).
            HStack {
                Image("juanDelaProfilePic")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                VStack(alignment: .leading, spacing: 0) {
                    Text("Juan Dela Cruz")
                        .font(.system(size: 14, weight: .semibold))
                    HStack(spacing: 5) {
                        Text("1 d")
                        Circle()
                            .frame(width: 2, height: 2)
                            .fontWeight(.bold)
                        Image(systemName: "globe")
                    }
                    .font(.system(size: 12))
                    .foregroundStyle(facebookBlue)
                }
                
                Spacer()
                
                // More(...) and x icon.
                HStack(spacing: 24) {
                    Image(systemName: "ellipsis")
                    Image(systemName: "xmark")
                }
                .foregroundStyle(Color(.darkGray))
                .fontWeight(.bold)
                
            }
            .padding(.horizontal)
            
            // Post Text
            Text("Time to party with the team")
                .padding(.horizontal)
            if !isVideo {
                // Post Image
                Image("office")
                    .resizable()
                    .scaledToFill()
            }
            else {
                // Video Player
                if let url = URL(string:"http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4") {
                    VideoPlayer(player: AVPlayer(url: url))
                        .frame(height: 400)
                }
                
            }
            // Likes, comments, and shares info part.
            HStack(spacing: 3) {
                Image("like")
                    .resizable()
                    .frame(width:18, height: 18)
                Text("5")
                
                Spacer()
                
                Text("3 comments")
                Text("•")
                    .fontWeight(.bold)
                Text("2 shares")
            }
            .padding(.horizontal)
            .font(.system(size: 12))
            .foregroundStyle(facebookBlue)
            
            // Divider
            Divider()
                .background(.white.opacity(0.5))
            
            // Post Actions (like, comment, send, share).
            HStack {
                Spacer()
                HStack {
                    Image(systemName: "hand.thumbsup")
                    Text("Like")
                }
                Spacer()
                HStack {
                    Image(systemName: "message")
                    Text("Comment")
                }
                Spacer()
                HStack {
                    Image("icone-messager-noir")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 22, height: 22)
                    Text("Send")
                }
                Spacer()
                HStack {
                    Image(systemName: "arrowshape.turn.up.right")
                    Text("Share")
                }
                Spacer()
            }
            .font(.system(size: 12))
            .foregroundStyle(facebookBlue)
        }
    }
}

#Preview {
    PostView(isVideo: false)
}
