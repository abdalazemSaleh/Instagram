//
//  CurrentUserProfile.swift
//  Instagram
//
//  Created by Abdalazem Saleh on 2023-05-13.
//

import SwiftUI

struct CurrentUserProfile: View {
    
    let user: User
    
    var posts: [Post] {
        return Post.MOC_POSTS.filter({$0.user?.userName == user.userName })
    }

    var body: some View {
        NavigationStack {
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
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        AuthService.shared.signOut()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

struct CurrentUserProfile_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserProfile(user: User.MOCK_USERS[1])
    }
}
