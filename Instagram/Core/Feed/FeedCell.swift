//
//  FeedCell.swift
//  Instagram
//
//  Created by Abdalazem Saleh on 2023-05-12.
//

import SwiftUI

struct FeedCell: View {
    let post: Post
    
    var body: some View {
        VStack {
            // image and user name
            HStack {
                if let user = post.user {
                    Image(user.profileImage ?? "")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 48, height: 48)
                        .clipShape(Circle())
                    Text(user.userName)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                Spacer()
            }
            .padding(.horizontal, 10)
            
            // post image
            Image(post.imageUrl)
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())
            
            // Action buttons
            HStack(spacing: 20) {
                Button {
                    print("Like post")
                } label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                        .fontWeight(.semibold)
                }
                
                Button {
                    print("Comment to post")
                } label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                        .fontWeight(.semibold)
                }
                
                Button {
                    print("Action")
                } label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                        .fontWeight(.semibold)
                }
                Spacer()
            }
            .padding([.horizontal, .top], 10)
            .foregroundColor(.black)
            // likes label
            Text("\(post.likes) likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 10)
                .padding(.top, 1)
            // caption label
            HStack(spacing: 4) {
                Text("\(post.user?.userName ?? "") ")
                    .fontWeight(.semibold)
                +
                Text(post.caption)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.footnote)
            .padding(.horizontal, 10)
            .padding(.top, 1)
            
            // post date
            Text("6h ago")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.footnote)
                .padding(.horizontal, 10)
                .padding(.top, 1)
                .foregroundColor(.gray)
        }
    }
    
    private func creatPostButton(image: Image, action: () -> Void) -> some View {
        Button {
            print("Action")
        } label: {
            image
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell(post: Post.MOC_POSTS[0])
    }
}
