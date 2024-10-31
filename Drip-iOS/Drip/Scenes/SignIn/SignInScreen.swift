//
//  SignInScreen.swift
//  Drip
//
//  Created by Shane Chi on 2024/10/27.
//

import SwiftUI

struct SignInScreen: View {
    @State var sampleText: String = ""
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
            TextInputField(text: $sampleText, placeholder: "E-mail")
            Spacer()
            ActionButton(title: "Sign in With Web3Auth")
            Spacer()
                .frame(height: 80)
        }
        .padding(.init(top: 80, leading: 24, bottom: 0, trailing: 24))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(DripColor.backgroundGrey.ignoresSafeArea())
    }
}

#Preview {
    SignInScreen()
}
