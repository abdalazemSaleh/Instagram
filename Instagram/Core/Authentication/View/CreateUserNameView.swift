//
//  CreateUserNameView.swift
//  Instagram
//
//  Created by Abdalazem Saleh on 2023-05-13.
//

import SwiftUI

struct CreateUserNameView: View {

    @EnvironmentObject var viewModel: RegistrationViewModel
    
    var body: some View {
        AddUserFlow(title: "Creat username",
                    descrption: "You'll user this username into your account.",
                    textFieldPlaceholder: "Enter your username",
                    buttonTitle: "Next",
                    isSecureField: false,
                    text: $viewModel.username,
                    destinationView: CreatePasswordView())
    }
}

struct CreateUserNameView_Previews: PreviewProvider {
    static var previews: some View {
        CreateUserNameView()
    }
}
