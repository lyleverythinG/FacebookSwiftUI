//
//  AddEmailView.swift
//  FacebookSwiftUI
//
//  Created by Lyle Dane Carcedo on 3/21/25.
//

import SwiftUI

struct AddEmailView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel: RegistrationViewModel
    init(viewModel: RegistrationViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading, spacing: 20){
                Text("What's your email address?")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top)
                Text("Enter the email address at which you can be contacted. No one will see this on your profile.")
                    .font(.footnote)
                
                // Email field
                TextField("Email address", text: $viewModel.age)
                    .customTextFieldViewModifier(width: proxy.size.width - 30)
                
                Text("You will receive an email from us and can opt out anytime. ")
                    .font(.caption)
                +
                Text("Learn more")
                    .font(.caption)
                    .foregroundStyle(.blue)
                
                // next button with redirection to add password view
                NavigationLink {
                    AddPasswordView(viewModel: viewModel)
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
                
                // Sign up with mobile number
                Text("Sign up with Mobile Number")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: proxy.size.width - 26, height: 44)
                    .background(.white)
                    .foregroundStyle(Color(.darkGray))
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                
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
    AddEmailView(viewModel: RegistrationViewModel())
}
