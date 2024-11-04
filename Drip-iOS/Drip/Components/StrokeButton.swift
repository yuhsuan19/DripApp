//
//  StrokeButton.swift
//  Drip
//
//  Created by Shane Chi on 2024/11/4.
//

import SwiftUI

struct StokeButton: View {
    var title: String
    var action: (() -> Void)?

    var body: some View {
        Button(action: {
            action?()
        }) {
            Text(title)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(DripColor.main)
                .padding(20)
                .frame(maxWidth: .infinity)
                .background(Color.clear)
                .overlay(
                    RoundedRectangle(cornerRadius: 27)
                        .stroke(DripColor.main, lineWidth: 2)
                )
        }
    }
}

#Preview {
    StokeButton(title: "Button Title")
        .padding()
}
