//
//  SearchView.swift
//  Instagram
//
//  Created by Abdalazem Saleh on 2023-05-12.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel = SearchViewModel()
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user) {
                            creatUserCell(image: Image(user.profileImage ?? ""), name: user.userName, bio: user.bio ?? "")
                                .padding(.horizontal)
                        }
                        .foregroundColor(.black)
                    }
                }
                .padding(.top, 10)
                .searchable(text: $searchText, prompt: "Seaech for user")
            }
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func creatUserCell(image: Image, name: String, bio: String) -> some View {
        HStack (spacing: 10){
            image
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text(name)
                    .fontWeight(.semibold)
                Text(bio)
            }
            .font(.footnote)
            Spacer()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
