//
//  RegistrationViewModel.swift
//  Instagram
//
//  Created by Abdalazem Saleh on 2023-05-15.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    
    func creatUser() async throws {
        try await AuthService.shared.creatUser(email: email, password: password, userName: username)
        
        username = ""
        email = ""
        password = ""
    }

}
