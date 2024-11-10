//
//  ProfileRow.swift
//  Drip
//
//  Created by Shane Chi on 2024/10/31.
//

import SwiftUI

struct ProfileRow: View {
    @State var iconName: String
    @State var text: String
    var onTap: (() -> Void)?

    init(iconName: String, text: String, onTap: (() -> Void)? = nil) {
        self.iconName = iconName
        self.text = text
        self.onTap = onTap
    }

    var body: some View {
        HStack(spacing: 4) {
            Image(iconName)
                .resizable()
                .scaledToFit()
                .frame(width: 16, height: 16)
            Text(text)
                .font(.system(size: 14))
                .foregroundStyle(DripColor.primary500Disabled)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 20)
        }
        .padding(.all, 12)
        .onTapGesture {
            onTap?()
        }
    }
}

#Preview {
    ProfileRow(iconName: "wallet-addr", text: "0xb07dBaa1103e88f41BC906744b294716ed3882c4")
        .padding()
}
