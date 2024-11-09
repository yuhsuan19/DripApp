//
//  SetProfileScreen.swift
//  Drip
//
//  Created by Shane Chi on 2024/11/4.
//

import SwiftUI

struct SetProfileScreen: View {

    @StateObject private var viewModel: SetProfileViewModel
    @State private var username: String = ""

    init(viewModel: SetProfileViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(spacing: 24) {
            Text("Set Profile")
                .font(.system(size: 24, weight: .medium))
                .foregroundStyle(.black)
                .frame(height: 32)
            VStack(spacing: 12) {
                DripAvatar(
                    bg: viewModel.avatarBg,
                    bd: viewModel.avatarBody,
                    hd: viewModel.avatarHead,
                    gls: viewModel.avatarGlasses,
                    acc: viewModel.avatarAccessory,
                    size: 200
                )
                Button(action: {
                    viewModel.randomlyGenerateAvatar()
                }) {
                    Text("Generate Nouns!")
                        .font(.custom("LondrinaSolid-Regular", size: 36))
                        .foregroundStyle(DripColor.main)
                        .frame(height: 43)
                }
            }
            VStack(spacing: 4) {
                Text("Name")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundStyle(DripColor.primary500Disabled)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .frame(height: 20)
                TextInputField(text: $username, placeholder: "Enter your name")
                    .foregroundStyle(DripColor.mainText)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled(true)
            }
            Spacer()
            ActionButton(title: "Done") {
                print("Done")
            }
        }
        .padding(.init(top: 24, leading: 24, bottom: 40, trailing: 24))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(DripColor.backgroundGrey.ignoresSafeArea())
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    SetProfileScreen(viewModel: SetProfileViewModel())
}
