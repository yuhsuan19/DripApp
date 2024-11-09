//
//  SetProfileScreen.swift
//  Drip
//
//  Created by Shane Chi on 2024/11/4.
//

import SwiftUI

struct SetProfileScreen: View {

    @StateObject private var viewModel: SetProfileViewModel
    
    init(viewModel: SetProfileViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(spacing: 0) {
            Text("Set Profile")
                .font(.system(size: 26, weight: .heavy))
                .foregroundStyle(DripColor.main)
                .padding(.bottom, 20)
            DripAvatar(
                bg: viewModel.avatarBg,
                bd: viewModel.avatarBody,
                hd: viewModel.avatarHead,
                gls: viewModel.avatarGlasses,
                acc: viewModel.avatarAccessory,
                size: 240
            )
            .padding(.bottom, 12)
            Button(action: {
                viewModel.randomlyGenerateAvatar()
            }) {
                Text("Generate Nouns!")
                    .font(.system(size: 22, weight: .black))
                    .foregroundStyle(DripColor.nounsMain)
            }
            Spacer()
        }
        .padding(.horizontal, 24)
        .padding(.top, 30)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(DripColor.backgroundGrey.ignoresSafeArea())
    }
}

#Preview {
    SetProfileScreen(viewModel: SetProfileViewModel())
}
