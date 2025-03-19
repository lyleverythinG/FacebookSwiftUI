//
//  LoginViewModel.swift
//  FacebookSwiftUI
//
//  Created by Lyle Dane Carcedo on 3/19/25.
//
import SwiftUI


class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
}
