//
//  User.swift
//  Instagram
//
//  Created by Abdalazem Saleh on 2023-05-13.
//

import Foundation
import Firebase

struct User: Identifiable, Hashable, Codable {
    let id: String
    let email: String
    var userName: String
    var profileImage: String?
    var fullName: String?
    var bio: String?
    
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id 
    }
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString , email: "Abdalazem.saleh2@icloud.com", userName: "Abdalazem.saleh", profileImage: "image", fullName: "Abdalazem Saleh", bio: "iOS developer"),
        
        .init(id: NSUUID().uuidString , email: "Shrouk.Ahmed@icloud.com", userName: "Shrouk.Ahmed", profileImage: "shrouk", fullName: "Shrouk Ahmed", bio: "Designer"),
        
        .init(id: NSUUID().uuidString , email: "Mai.Saleh@icloud.com", userName: "Mai.Saleh", profileImage: "mai", fullName: "Mai Saleh", bio: "UI/UX")        
    ]
}
