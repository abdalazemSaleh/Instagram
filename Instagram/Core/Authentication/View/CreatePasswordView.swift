//
//  CreatePasswordView.swift
//  Instagram
//
//  Created by Abdalazem Saleh on 2023-05-13.
//

import SwiftUI

struct CreatePasswordView: View {
    
    @EnvironmentObject var viewModel: RegistrationViewModel

    var body: some View {
        AddUserFlow(title: "Create a password",
                    descrption: "Your password must be at least 8 characters in lenght.",
                    textFieldPlaceholder: "Enter your password",
                    buttonTitle: "Next",
                    isSecureField: true,
                    text: $viewModel.password,
                    destinationView: CompleteSignUpView())
    }
}

struct CreatePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePasswordView()
    }
}
