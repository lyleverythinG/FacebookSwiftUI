//
//  Untitled.swift
//  FacebookSwiftUI
//
//  Created by Lyle Dane Carcedo on 3/5/25.
//
import SwiftUI

struct DividerView: View {
    private var width: CGFloat
    init(width: CGFloat) {
        self.width = width
    }
    
    var body: some View {
        Rectangle()
            .foregroundStyle(Color(.systemGray6))
            .frame(width: width, height: 6)
    }
}

#Preview {
    DividerView(width: 390)
}

