//
//  RegistrationViewModel.swift
//  FacebookSwiftUI
//
//  Created by Lyle Dane Carcedo on 3/20/25.
//

import SwiftUI

class RegistrationViewModel: ObservableObject {
    @Published var firstName: String = ""
    @Published var familyName: String = ""
    @Published var gender: String = ""
    @Published var genderChoices: [String] = ["female", "male", "More options"]
    @Published var age: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    
    @MainActor
    func createUser() async throws {
        if let age = Int(age) {
            try await AuthService.shared.createUser(email: email, password: password, firstName: firstName, familyName: familyName, age: age, gender: gender)
        } else {
            try await AuthService.shared.createUser(email: email, password: password, firstName: firstName, familyName: familyName, age: 0, gender: gender)
        }
    }
}
