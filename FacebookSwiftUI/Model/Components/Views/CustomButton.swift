//
//  CustomButton.swift
//  FacebookSwiftUI
//
//  Created by Lyle Dane Carcedo on 3/5/25.
//

import SwiftUI

struct CustomButton: View {
    private var imageName: String
    private var title: String
    private var backgroundColor: Color
    private var foregroundColor: Color
    
    init(imageName: String, title: String, backgroundColor: Color, foregroundColor: Color) {
        self.imageName = imageName
        self.title = title
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
    }
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
            Text(title)
                .font(.footnote)
                .fontWeight(.semibold)
        }
        .foregroundStyle(foregroundColor)
        .padding(.horizontal)
        .frame(height: 34)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
