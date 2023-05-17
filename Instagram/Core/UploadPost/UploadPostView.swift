//
//  UploadPostView.swift
//  Instagram
//
//  Created by Abdalazem Saleh on 2023-05-13.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    @StateObject var viewModel = UploadPostViewModel()
    @State private var caption = ""
    @State private var photoPickerPresented = false
    @Binding var tabIndex: Int
    
    var body: some View {
        VStack {
            actionToolBar()
            
            postAndCaption()
            
            Spacer()
        }
        .onAppear {
            photoPickerPresented.toggle()
        }
        .photosPicker(isPresented: $photoPickerPresented, selection: $viewModel.selectedPhoto)
    }
    
    private func actionToolBar() -> some View {
        HStack {
            Button {
                caption = ""
                viewModel.selectedPhoto = nil
                viewModel.postImage = nil
                tabIndex = 0
            } label: {
                Text("Cancel")
                    .fontWeight(.semibold)
            }
            
            Spacer()
            
            Text("New post")
                .fontWeight(.semibold)
            
            Spacer()
            
            Button {
                
            } label: {
                Text("Upload")
                    .fontWeight(.semibold)
            }
        }
        .padding(.horizontal)
    }
    
    private func postAndCaption() -> some View {
        HStack(spacing: 8) {
            if let image = viewModel.postImage {
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(4)
                    .clipped()
            }
            
            TextField("Enter your caption...", text: $caption, axis: .vertical)
        }
        .padding()
    }
    
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView(tabIndex: .constant(0))
    }
}
