//
//  CustomButtonModifier.swift
//  FacebookSwiftUI
//
//  Created by Lyle Dane Carcedo on 3/8/25.
//

import SwiftUI

struct CustomButtonModifier: ViewModifier {
    var width: CGFloat
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .fontWeight(.semibold)
            .frame(width: width - 30, height: 44)
            .background(Color(.systemGray4))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .foregroundStyle(.black)
            .padding(.vertical)
    }
}

extension View {
    func customButtonModifier(width: CGFloat) -> some View {
        modifier(CustomButtonModifier(width: width))
    }
}
