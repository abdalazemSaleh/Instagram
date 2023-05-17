//
//  UserService.swift
//  Instagram
//
//  Created by Abdalazem Saleh on 2023-05-16.
//

import Foundation
import Firebase

struct UserService {
        
    static func fetchAllUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        return snapshot.documents.compactMap({ try? $0.data(as: User.self) })
    }
    
}
