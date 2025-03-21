//
//  RootView.swift
//  FacebookSwiftUI
//
//  Created by Lyle Dane Carcedo on 3/21/25.
//
import SwiftUI

struct RootView: View {
    @StateObject private var viewModel = RootViewModel()
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                MainTabView()
            } else {
                LoginView()
            }
        }
    }
}

