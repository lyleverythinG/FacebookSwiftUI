//
//  CustomTextFieldModifier.swift
//  FacebookSwiftUI
//
//  Created by Lyle Dane Carcedo on 3/19/25.
//

import SwiftUI

struct CustomTextFieldViewModifier: ViewModifier {
    private var width: CGFloat
    init(width: CGFloat) {
        self.width = width
    }
    
    func body(content:  Content) -> some View {
        content
            .padding(12)
            .background(.white)
            .frame(width: width, height: 50)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func customTextFieldViewModifier(width: CGFloat) -> some View {
        modifier(CustomTextFieldViewModifier(width: width))
    }
}
