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
        HStack(spacing: 12) {
            Image(iconName)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
            Text(text)
                .font(.system(size: 12))
                .foregroundStyle(DripColor.mainText)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .onTapGesture {
            onTap?()
        }
    }
}

#Preview {
    ProfileRow(iconName: "wallet-addr", text: "0xb07dBaa1103e88f41BC906744b294716ed3882c4")
        .padding()
}
