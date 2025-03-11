//
//  VideoView.swift
//  FacebookSwiftUI
//
//  Created by Lyle Dane Carcedo on 3/8/25.
//

import SwiftUI

struct VideoView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VideoOptionsView()
                //TODO: Uncomment and implement this part later.
                //                ForEach(0 ..< 3) { _ in
                //                    PostView(isVideo: true)
                //                }
            }
            .scrollIndicators(.hidden)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack(spacing: 16) {
                        Image(systemName: "person.fill")
                        Image(systemName: "magnifyingglass")
                    }
                    .fontWeight(.bold)
                }
            }
        }
    }
}

#Preview {
    VideoView()
}
