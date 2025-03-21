//
//  AgeView.swift
//  FacebookSwiftUI
//
//  Created by Lyle Dane Carcedo on 3/21/25.
//
import SwiftUI

struct AgeView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel: RegistrationViewModel
    init(viewModel: RegistrationViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading, spacing: 20){
                Text("How old are you?")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top)
                
                // Age field
                TextField("Age", text: $viewModel.age)
                    .customTextFieldViewModifier(width: proxy.size.width - 30)
                
                // next button with redirection to gender view
                    NavigationLink {
                        GenderView(viewModel: viewModel)
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

                // Use date of birth
                Text("Use date of birth")
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
    AgeView(viewModel: RegistrationViewModel())
}

