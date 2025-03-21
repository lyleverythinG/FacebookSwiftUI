//
//  AddPasswordView.swift
//  FacebookSwiftUI
//
//  Created by Lyle Dane Carcedo on 3/21/25.
//

import SwiftUI

struct AddPasswordView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel: RegistrationViewModel
    init(viewModel: RegistrationViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading, spacing: 20){
                Text("Create a password")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top)
                Text("Create a password within at least 6 letters or numbers. It should be something that others can't guess.")
                    .font(.footnote)
                
                // Password field
                SecureField("Password", text: $viewModel.password)
                    .customTextFieldViewModifier(width: proxy.size.width - 30)
                
                // next button with redirection to agreement view
                NavigationLink {
                    AgreementView(viewModel: viewModel)
                        .navigationBarBackButtonHidden()
                } label: {
                    Text("Next")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: proxy.size.width - 26, height: 44)
                        .background(.blue)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .padding(.vertical)
                }
                
                Spacer()
                
                // Already have an account
                HStack {
                    Spacer()
                    Text("Already have an account?")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.blue)
                    Spacer()
                }
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "arrow.backward")
                        .imageScale(.large)
                        .onTapGesture {
                            dismiss()
                        }
                }
            }
            .background(Color(.systemGray5))
        }
    }
}

#Preview {
    AddPasswordView(viewModel: RegistrationViewModel())
}
