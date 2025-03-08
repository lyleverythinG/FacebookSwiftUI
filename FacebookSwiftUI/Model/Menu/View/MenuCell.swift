//
//  MenuCell.swift
//  FacebookSwiftUI
//
//  Created by Lyle Dane Carcedo on 3/8/25.
//

import SwiftUI

struct MenuCell: View {
    private var title: String
    private var imageName: String
    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Divider()
            HStack(spacing: 15) {
                // Prefix icon
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 24, height: 24)
                    .foregroundStyle(.gray)
                
                // Text
                Text(title)
                
                Spacer()
                
                // Suffix icon
                Image(systemName: "chevron.down")
            }
            .padding(.horizontal)
            .padding(.vertical, 7)
            .font(.headline)
        }
    }
}

#Preview {
    MenuCell(title: "Help and Support", imageName: "plus")
}
