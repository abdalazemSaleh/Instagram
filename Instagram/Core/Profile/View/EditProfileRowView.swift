//
//  EditProfileRowView.swift
//  Instagram
//
//  Created by Abdalazem Saleh on 2023-05-17.
//

import SwiftUI

struct EditProfileRowView: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            Text(title)
                .padding(.leading)
                .frame(width: 100, alignment: .leading)
            
            VStack {
                TextField(title, text: $text)
                
                Divider()
            }
        }
        .font(.subheadline)
        .frame(height: 36)
    }
}
