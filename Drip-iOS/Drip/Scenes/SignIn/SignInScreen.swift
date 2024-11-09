//
//  SignInScreen.swift
//  Drip
//
//  Created by Shane Chi on 2024/10/27.
//

import SwiftUI

struct SignInScreen: View {

    var onSignIn: (() -> Void)?

    @StateObject private var viewModel: SignInViewModel
    @State private var emailText: String = ""

    init(viewModel: SignInViewModel, onSignIn: (() -> Void)? = nil) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.onSignIn = onSignIn
    }

    var body: some View {
        VStack(spacing: 8) {
            Image(.dripLogo)
                .resizable()
                .frame(width: 114 ,height: 120)
            Text("Welcome")
                .foregroundStyle(.black)
                .font(.custom("LondrinaSolid-Regular", size: 36))
                .frame(height: 58)
            Text("Enter your email address to start!")
                .foregroundStyle(DripColor.primary500Disabled)
                .font(.system(size: 16, weight: .regular))
                .frame(height: 24)
            Spacer().frame(height: 8)
            TextInputField(text: $emailText, placeholder: "E-mail")
                .foregroundStyle(DripColor.mainText)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled(true)
                .keyboardType(.emailAddress)
            Spacer()
            ActionButton(title: "Sign in With Web3Auth") {
                viewModel.signIn(with: emailText)
            }
            Spacer().frame(height: 40)
        }
        .padding(.init(top: 30, leading: 28, bottom: 0, trailing: 28))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(DripColor.backgroundGrey.ignoresSafeArea())
        .onChange(of: viewModel.isSignedIn) {
            guard viewModel.isSignedIn else { return }
            onSignIn?()
        }
    }
}

#Preview {
    let viewModel = SignInViewModel(web3AuthService: Web3AuthService())
    return SignInScreen(viewModel: viewModel)
}
