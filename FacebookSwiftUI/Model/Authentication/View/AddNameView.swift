//
//  AddNameView.swift
//  FacebookSwiftUI
//
//  Created by Lyle Dane Carcedo on 3/20/25.
//

import SwiftUI

struct AddNameView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel = RegistrationViewModel()
    
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading, spacing: 20){
                Text("What's your name?")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top)
                Text("Enter the name you use in real life")
                    .font(.footnote)
                
                // first name and surname fields
                HStack {
                    TextField("First name", text: $viewModel.firstName)
                        .customTextFieldViewModifier(width: (proxy.size.width / 2.3) + 5)
                    Spacer()
                    TextField("Surname", text: $viewModel.familyName)
                        .customTextFieldViewModifier(width: (proxy.size.width / 2.3) + 5)
                }
                
                // next button with redirection to age view
                NavigationLink {
                    AgeView(viewModel: viewModel)
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
    AddNameView()
}

