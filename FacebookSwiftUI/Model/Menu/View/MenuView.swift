//
//  MenuView.swift
//  FacebookSwiftUI
//
//  Created by Lyle Dane Carcedo on 3/8/25.
//

import SwiftUI

struct MenuView: View {
    @State private var showLogoutAlert: Bool = false
    
    var body: some View {
        NavigationView {
            GeometryReader { proxy in
                ScrollView {
                    VStack(alignment: .leading) {
                        MenuHeaderView()
                        ShorcutsView(width: proxy.size.width)
                        
                        // Bottom menu
                        MenuCell(title: "Help and Support", imageName: "questionmark.circle.fill")
                        MenuCell(title: "Settings & Privacy", imageName: "gearshape.fill")
                        MenuCell(title: "Also from Meta", imageName: "window.casement.closed")
                        
                        // Logout btn
                        Button {
                            showLogoutAlert.toggle()
                        } label: {
                            Text("Log Out")
                                .customButtonModifier(width: proxy.size.width)
                                .padding()
                        }
                    }
                }
                .alert("Logout of your account?", isPresented: $showLogoutAlert) {
                    Button("Logout") {
                        //TODO: Can create another view model for menu.
                        AuthService.shared.signOut()
                    }
                    Button("Cancel", role: .cancel) { }
                }
                .background(Color(.systemGray6))
                .scrollIndicators(.hidden)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Text("Menu")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        HStack(spacing: 24) {
                            Image(systemName: "gearshape.fill")
                            Image(systemName: "magnifyingglass")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    MenuView()
}
