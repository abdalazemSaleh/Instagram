//
//  LoginView.swift
//  Instagram
//
//  Created by Abdalazem Saleh on 2023-05-13.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
            NavigationStack {
                VStack {
                    Spacer()
                    
                    creatLogoImage()
                    
                    creatTextFields()
                    
                    creatForgetPasswordButton()
                    
                    createLoginButton()
                    
                    createOrLabel()
                    
                    creatFacebookButton()
                    
                    Spacer()
                    Divider()
                    
                    creatSignUpButton()
                }
            }
    }
    
    private func creatLogoImage() -> some View {
        Image("logoName")
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 100)
    }
    
    private func creatTextFields() -> some View {
        VStack(spacing: 8) {
            TextField("Enter your email", text: $viewModel.email)
                .textInputAutocapitalization(.none)
                .modifier(GFTextFiledModifier())
            
            SecureField("Enter your password..", text: $viewModel.password)
                .font(.subheadline)
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(8)
        }
        .padding(.horizontal)
    }
    
    private func creatForgetPasswordButton() -> some View {
        Button {
            
        } label: {
            Text("Forget password?")
                .font(.footnote)
                .fontWeight(.semibold)
                .padding(.top)
                .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
    
    private func createLoginButton() -> some View {
        Button {
            Task {
                try await viewModel.signIn()
            }
        } label: {
            Text("Login")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, minHeight: 48, maxHeight: 48)
                .background(Color(.systemBlue))
                .cornerRadius(8)
        }
        .padding()
    }
    
    private func createOrLabel() -> some View {
        HStack {
            Rectangle()
                .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
            
            Text("OR")
                .font(.footnote)
                .fontWeight(.semibold)
            
            Rectangle()
                .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
        }
        .foregroundColor(.gray)
    }
    
    private func creatFacebookButton() -> some View {
        HStack {
            Image("")
                .resizable()
                .frame(width: 24, height: 24)
            
            Text("Continue whit Facebook")
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundColor(Color(.systemBlue))
        }
        .padding(.top, 8)
    }
    
    private func creatSignUpButton() -> some View {
        NavigationLink {
            AddEmailView()
                .navigationBarBackButtonHidden(true)
        } label: {
            HStack(spacing: 2) {
                Text("Don't have an account?")
                
                Text("Sign up")
                    .fontWeight(.bold)
            }
            .padding(.vertical)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
