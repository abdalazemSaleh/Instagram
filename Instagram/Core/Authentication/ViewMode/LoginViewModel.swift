//
//  LoginViewModel.swift
//  Instagram
//
//  Created by Abdalazem Saleh on 2023-05-15.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""

    func signIn() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
