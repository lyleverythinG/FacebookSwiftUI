//
//  GenderView.swift
//  FacebookSwiftUI
//
//  Created by Lyle Dane Carcedo on 3/20/25.
//

import SwiftUI

struct GenderView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel: RegistrationViewModel
    init(viewModel: RegistrationViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading, spacing: 20) {
                Text("What's your gender?")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top)
                Text("You can change who can see your gender on your profile later")
                    .font(.footnote)
                
                // Gender options container
                VStack(alignment: .leading, spacing: 24) {
                    ForEach(viewModel.genderChoices, id: \.self) { gender in
                        Button(action: {
                            viewModel.gender = gender
                        }, label: {
                            HStack {
                                VStack(alignment: .leading) {
                                    // Gender
                                    Text(gender)
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.black)
                                    if gender == "More options" {
                                        Text("Select more options to choose another gender or if you'd rather not say")
                                            .font(.subheadline)
                                            .foregroundStyle(Color(.darkGray))
                                            .padding(.trailing)
                                            .multilineTextAlignment(.leading)
                                    }
                                }
                                Spacer()
                                Circle()
                                    .stroke(viewModel.gender == gender ? .blue : .gray, lineWidth: 1)
                                    .frame(width: 25, height: 25)
                                    .overlay {
                                        Circle()
                                            .frame(width: 15, height: 15)
                                            .foregroundStyle(viewModel.gender == gender ? .blue : .clear)
                                    }
                            }
                        })
                        
                    }
                }
                .padding(20)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                // Next button
                NavigationLink {
                    AddEmailView(viewModel: viewModel)
                        .navigationBarBackButtonHidden()
                } label: {
                    Text("Next")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: proxy.size.width - 30, height: 44)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .padding(.top)
                }
                
                Spacer()
                HStack {
                    Spacer()
                    Text("Already have an account?")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.blue)
                    Spacer()
                }
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "arrow.backward")
                        .imageScale(.large)
                        .onTapGesture {
                            dismiss()
                        }
                }
            }
            .padding()
            .background(Color(.systemGray5))
        }
    }
}

#Preview {
    GenderView(viewModel: RegistrationViewModel())
}
