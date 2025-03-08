//
//  ExtractedView.swift
//  FacebookSwiftUI
//
//  Created by Lyle Dane Carcedo on 3/8/25.
//


import SwiftUI

struct ShorcutsView: View {
    private var gridItems: [GridItem] = [
        .init(.flexible(), spacing: 15),
        .init(.flexible(), spacing: 15),
    ]
    private var shorcutsArray: [(String,String)] = [
        ("Memories", "gobackward"),
        ("Saved", "bookmark.fill"),
        ("Groups", "person.2.circle"),
        ("Video", "play.tv.fill"),
        ("MarketPlace", "storefront.fill"),
        ("Friends", "person.2.fill"),
        ("Feeds", "calendar.badge.clock"),
        ("Events", "calendar"),
    ]
    private var width: CGFloat
    init( width: CGFloat) {
        self.width = width
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            // Your shorcuts text.
            Text("Your shorcuts")
                .font(.headline)
                .foregroundStyle(Color(.darkGray))
            
            // Shorcuts items.
            LazyVGrid(columns: gridItems, spacing: 15) {
                ForEach(0 ..< 8) { index in
                    VStack(alignment: .leading, spacing: 12) {
                        Image(systemName: shorcutsArray[index].1)
                            .foregroundStyle(.blue)
                        Text(shorcutsArray[index].0)
                            .font(.headline)
                        HStack { Spacer() }
                        
                    }
                    .padding(.horizontal)
                    .frame(width: width * 0.45, height: 80)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            
            // See more btn.
            Button {
                
            } label: {
                Text("See more")
                    .customButtonModifier(width: width)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    ShorcutsView(width: 400)
}
