//
//  VideoOptionViewModifier.swift
//  FacebookSwiftUI
//
//  Created by Lyle Dane Carcedo on 3/8/25.
//

import SwiftUI

struct VideoOptionViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .fontWeight(.semibold)
            .foregroundStyle(Color(.darkGray))
    }
}

extension View {
    func videoOptionViewModifier() -> some View {
        modifier(VideoOptionViewModifier())
    }
}
