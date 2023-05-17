//
//  AddUserFlow.swift
//  Instagram
//
//  Created by Abdalazem Saleh on 2023-05-13.
//

import SwiftUI

struct AddUserFlow<DestinationType: View>: View {
    
    let title: String
    let descrption: String
    let textFieldPlaceholder: String
    let buttonTitle: String
    let isSecureField: Bool
    @Binding var text: String
    var destinationView: DestinationType

    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            VStack {
                // label
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top)
                
                // descrption text
                Text(descrption)
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            
            // Email field
            if isSecureField {
                SecureField(textFieldPlaceholder, text: $text)
                    .textInputAutocapitalization(.none)
                    .modifier(GFTextFiledModifier())
                    .padding()
            } else {
                TextField(textFieldPlaceholder, text: $text)
                    .textInputAutocapitalization(.none)
                    .modifier(GFTextFiledModifier())
                    .padding()
            }
            // Next button
            NavigationLink(
                destination: destinationView
                .navigationBarBackButtonHidden(true)
            ) {
                Text(buttonTitle)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: 48)
                    .background(Color(.systemBlue))
                    .cornerRadius(8)
            }
            .padding(.horizontal)
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
    }
}
