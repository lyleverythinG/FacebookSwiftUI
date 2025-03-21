//
//  RootViewModel.swift
//  FacebookSwiftUI
//
//  Created by Lyle Dane Carcedo on 3/21/25.
//
import SwiftUI
import Combine
import FirebaseAuth

class RootViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        AuthService.shared.$userSession.sink { userSession in
            self.userSession = userSession
        }
        .store(in: &cancellables)
    }
}

