//
//  LoginView.swift
//  FacebookSwiftUI
//
//  Created by Lyle Dane Carcedo on 3/19/25.
//
import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                VStack(spacing: 70) {
                    Spacer()
                    
                    // Facebook Icon
                    Image("Facebook_Circle")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 70, height: 70)
                    
                    // email, password fields, and login btn
                    VStack(spacing: 24) {
                        TextField("Mobile number or email address", text: $viewModel.email)
                            .textInputAutocapitalization(.never)
                            .customTextFieldViewModifier(width: proxy.size.width - 30)
                        SecureField("Password", text: $viewModel.password)
                            .textInputAutocapitalization(.never)
                            .customTextFieldViewModifier(width: proxy.size.width - 30)
                        Button(action: {
                            Task {try await viewModel.login() }
                        }, label: {
                            Text("Log In")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                                .frame(width: proxy.size.width - 30, height: 44)
                                .background(.blue)
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                        })
                        
                        // Forgotten Password
                        Text("Forgotten Password?")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                    HStack { Spacer() }
                    Spacer()
                    
                    // Create new account
                    VStack(spacing: 24) {
                        NavigationLink {
                            AddNameView()
                                .navigationBarBackButtonHidden()
                        } label: {
                            Text("Create new account")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .frame(width: proxy.size.width - 30 , height: 44)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(.blue, lineWidth: 1)
                                }
                        }
                        
                        // Meta
                        HStack(spacing: 5) {
                            Image("meta")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 16, height: 16)
                            Text("Meta")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                        }
                        .foregroundStyle(Color(.darkGray))
                    }
                }
                .background(Color(.systemGray5))
            }
        }
    }
}

#Preview {
    LoginView()
}

