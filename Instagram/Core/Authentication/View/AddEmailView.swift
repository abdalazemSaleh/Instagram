//
//  AddEmailView.swift
//  Instagram
//
//  Created by Abdalazem Saleh on 2023-05-13.
//

import SwiftUI

struct AddEmailView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    
    var body: some View {
        AddUserFlow(title: "Add email",
                    descrption: "You'll user this email to sign in to your account.",
                    textFieldPlaceholder: "Enter your email",
                    buttonTitle: "Next",
                    isSecureField: false,
                    text: $viewModel.email,
                    destinationView: CreateUserNameView())
    }
    
}

struct AddEmailView_Previews: PreviewProvider {
    static var previews: some View {
        AddEmailView()
    }
}
