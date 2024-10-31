//
//  ProfileScreen.swift
//  Drip
//
//  Created by Shane Chi on 2024/10/31.
//

import SwiftUI

struct ProfileScreen: View {
    var body: some View {
        VStack() {
            CircleAvatar(size: 95, borderWidth: 1)
                .padding(.init(top: 0, leading: 0, bottom: 8, trailing: 0))
            Text("yuhsuan.drip.eth")
                .font(.system(size: 20, weight: .regular))
                .foregroundStyle(DripColor.mainText)
                .padding(.init(top: 0, leading: 0, bottom: 12, trailing: 0))
            VStack(alignment: .leading, spacing: 12) {
                ProfileRow(iconName: "wallet-addr", text: "0xb07dBaa1103e88f41BC906744b294716ed3882c4") {
                    UIPasteboard.general.string = "0xb07dBaa1103e88f41BC906744b294716ed3882c4"
                }
                ProfileRow(iconName: "email", text: "shane.chi@portto.com")
            }
            .frame(maxWidth: .infinity)
            .padding(.init(top: 12, leading: 12, bottom: 12, trailing: 12))
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 13))
            Spacer().frame(height: 20)
            Text("Tokens")
                .font(.system(size: 18, weight: .semibold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(DripColor.subText)
            VStack(alignment: .leading, spacing: 12) {
                ProfileRow(iconName: "token-eth", text: "9.3413 ETH")
                ProfileRow(iconName: "token-usdc", text: "3662.7843 USDC")
                ProfileRow(iconName: "token-usdt", text: "0 USDT")
            }
            .frame(maxWidth: .infinity)
            .padding(.init(top: 12, leading: 12, bottom: 12, trailing: 12))
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 13))

            Spacer()
            ActionButton(title: "Log Out", backgroundColor: DripColor.warning)
            Spacer().frame(height: 20)
        }
        .padding(.init(top: 40, leading: 20, bottom: 0, trailing: 20))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(DripColor.backgroundGrey.ignoresSafeArea())
    }
}

#Preview {
    ProfileScreen()
}
