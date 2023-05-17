//
//  EditProfileViewModel.swift
//  Instagram
//
//  Created by Abdalazem Saleh on 2023-05-17.
//

import Foundation
import PhotosUI
import SwiftUI
import Firebase

@MainActor
class EditProfileViewModel: ObservableObject {
    @Published var user: User
    @Published var profileImage: Image?
    @Published var fullName = ""
    @Published var bio = ""
    @Published var selectedPhoto: PhotosPickerItem? {
        didSet {
            Task { await loadImage(fromItem: selectedPhoto) }
        }
    }
    
    private var uiImage: UIImage?
    
    init(user: User) {
        self.user = user
    }

    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        guard let data = try? await  item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    func updateUserData() async throws {
        var data = [String: Any]()
        
        if let uiImage = uiImage {
            let imageURL = try? await ImageUploader.upload(image: uiImage)
            data["profileImageURL"] = imageURL
        }
        
        if !fullName.isEmpty && user.fullName != fullName {
            data["fullname"] = fullName
        }
        
        if !bio.isEmpty && user.bio != bio {
            data["bio"] = bio
        }
        
        if !data.isEmpty {
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
        }
    }
}
