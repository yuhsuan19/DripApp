//
//  ProfileScreen.swift
//  Drip
//
//  Created by Shane Chi on 2024/10/31.
//

import SwiftUI

struct ProfileScreen: View {
    var body: some View {
        VStack(spacing: 24) {
            Text("Profile")
                .font(.system(size: 24, weight: .medium))
                .frame(height: 32)
                .foregroundStyle(.black)

            DripAvatar(bg: 1, bd: 1, hd: 1, gls: 1, acc: 1, size: 100)
            Text("User handle")
                .font(.custom("LondrinaSolid-Regular", size: 36))
                .frame(height: 44)
                .foregroundStyle(.black)

            VStack(alignment: .leading, spacing: 0) {
                ProfileRow(iconName: "wallet-addr", text: "0xb07dBaa1103e88f41BC906744b294716ed3882c4") {
                    UIPasteboard.general.string = "0xb07dBaa1103e88f41BC906744b294716ed3882c4"
                }
                ProfileRow(iconName: "email", text: "shane.chi@portto.com")
            }
            .frame(maxWidth: .infinity)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 16))

            VStack(spacing: 8) {
                Text("Tokens")
                    .font(.system(size: 18, weight: .medium))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .frame(height: 28)
                    .foregroundStyle(.black)
                VStack(alignment: .leading, spacing: 0) {
                    ProfileRow(iconName: "token-eth", text: "9.3413 ETH")
                    ProfileRow(iconName: "token-usdc", text: "3662.7843 USDC")
                    ProfileRow(iconName: "token-usdt", text: "0 USDT")
                }
                .frame(maxWidth: .infinity)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 13))
            }

            Spacer()
            ActionButton(title: "Log Out", backgroundColor: DripColor.warning)
        }
        .padding(.init(top: 24, leading: 24, bottom: 40, trailing: 24))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(DripColor.backgroundMain.ignoresSafeArea())
    }
}
