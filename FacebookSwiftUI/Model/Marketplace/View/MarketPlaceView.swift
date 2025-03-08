//
//  MarketPlaceView.swift
//  FacebookSwiftUI
//
//  Created by Lyle Dane Carcedo on 3/8/25.
//

import SwiftUI

struct MarketPlaceView: View {
    @StateObject private var viewModel = MarketPlaceViewModel()
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 2),
        .init(.flexible(), spacing: 2),
    ]
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                ScrollView {
                    
                    // Sell and categories btn.
                    HStack {
                        MarketPlaceButton(title: "Sell", imageName: "square.and.pencil",width: proxy.size.width)
                        MarketPlaceButton(title: "Categories", imageName: "list.bullet",width: proxy.size.width)
                    }
                    .padding()
                    
                    Divider()
                    
                    // Todays picks text and location display.
                    VStack(alignment: .leading) {
                        HStack(spacing: 2) {
                            Text("Today's picks")
                                .font(.headline)
                                .fontWeight(.semibold)
                            Spacer()
                            Image("pin")
                                .resizable()
                                .frame(width: 20, height: 16)
                            Text("London")
                                .font(.subheadline)
                                .foregroundStyle(.blue)
                        }
                        .padding()
                        
                        // MarketPlace results card.
                        LazyVGrid(columns: gridItems, spacing: 1) {
                            ForEach(viewModel.items) { item in
                                VStack {
                                    Image(item.imageName)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: (proxy.size.width / 2) - 3,
                                               height: (proxy.size.width / 2) - 3)
                                        .clipped()
                                    Text("\(item.itemPrice) - \(item.itemName)")
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                        .padding(.vertical)
                                }
                            }
                        }
                    }
                }
                .scrollIndicators(.hidden)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Text("MarketPlace")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        HStack(spacing: 24) {
                            Image(systemName: "person.fill")
                            Image(systemName: "magnifyingglass")
                        }
                        .fontWeight(.bold)
                    }
                }
            }
        }
    }
}

#Preview {
    MarketPlaceView()
}
