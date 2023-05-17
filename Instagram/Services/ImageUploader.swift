//
//  ImageUploader.swift
//  Instagram
//
//  Created by Abdalazem Saleh on 2023-05-17.
//

import UIKit
import FirebaseStorage

class ImageUploader {
    
    static func upload(image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return nil }
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        do {
            let _ = try await ref.putDataAsync(imageData)
            let url = try await ref.downloadURL()
            return url.absoluteString
        } catch {
            print("Error while uploading image: \(error.localizedDescription)")
            return nil
        }
    }
}
