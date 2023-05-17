//
//  ProfileView.swift
//  Instagram
//
//  Created by Abdalazem Saleh on 2023-05-12.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    
    private let imageDimension: CGFloat = (UIScreen.main.bounds.width / 3) - 2
    
    var posts: [Post] {
        return Post.MOC_POSTS.filter({$0.user?.userName == user.userName })
    }
    
    var body: some View {
        ScrollView {
            VStack {
                // header
                ProfileHeaderView(user: user)
                // posts
                PostGridView(posts: posts)
            }
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.MOCK_USERS[1])
    }
}
