//
//  SignInScreen.swift
//  Drip
//
//  Created by Shane Chi on 2024/10/27.
//

import SwiftUI

struct SignInScreen: View {

    @StateObject private var viewModel: SignInViewModel
    @State private var emailText: String = ""

    init(viewModel: SignInViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack() {
            Image(.dripLogoStroke)
                .resizable()
                .frame(width: 100 ,height: 100)
            Text("Welcome")
                .foregroundStyle(DripColor.darkSub)
                .font(.system(size: 49, weight: .bold))
            Spacer()
                .frame(height: 30)
            TextInputField(text: $emailText, placeholder: "E-mail")
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled(true)
                .keyboardType(.emailAddress)
            Spacer()
            ActionButton(title: "Sign in With Web3Auth") {
                viewModel.signIn(with: emailText)
            }
            Spacer()
                .frame(height: 30)
        }
        .padding(.init(top: 80, leading: 24, bottom: 0, trailing: 24))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(DripColor.backgroundGrey.ignoresSafeArea())
        .onChange(of: viewModel.isSignedIn) {
            guard viewModel.isSignedIn else { return }
            print("sign in")
        }
    }
}

#Preview {
    let viewModel = SignInViewModel(web3AuthService: Web3AuthService())
    return SignInScreen(viewModel: viewModel)
}
