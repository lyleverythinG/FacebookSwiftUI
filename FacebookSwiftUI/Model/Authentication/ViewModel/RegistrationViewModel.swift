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
}
