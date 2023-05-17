//
//  UploadPostViewModel.swift
//  Instagram
//
//  Created by Abdalazem Saleh on 2023-05-14.
//

import Foundation
import SwiftUI
import PhotosUI

@MainActor
class UploadPostViewModel: ObservableObject {
    
    @Published var selectedPhoto: PhotosPickerItem? {
        didSet {
            Task  {
                await loadImage(fromItem: selectedPhoto)
            }
        }
    }
    
    @Published var postImage: Image?
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        guard let data = try? await  item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.postImage = Image(uiImage: uiImage)
    }
}
