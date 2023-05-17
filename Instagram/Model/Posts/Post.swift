//
//  Post.swift
//  Instagram
//
//  Created by Abdalazem Saleh on 2023-05-13.
//

import Foundation

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Date
    var user: User?
}


extension Post {
    static var MOC_POSTS: [Post] = [
        .init(id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "I'm happy to share this photo",
              likes: 40,
              imageUrl: "image",
              timestamp: Date(),
              user: User.MOCK_USERS[0]),
        
            .init(id: NSUUID().uuidString,
                  ownerUid: NSUUID().uuidString,
                  caption: "Test caption",
                  likes: 32,
                  imageUrl: "shrouk",
                  timestamp: Date(),
                  user: User.MOCK_USERS[1]),
        
        .init(id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "happy to share my design",
              likes: 32,
              imageUrl: "mai",
              timestamp: Date(),
              user: User.MOCK_USERS[2]),
    ]
}
