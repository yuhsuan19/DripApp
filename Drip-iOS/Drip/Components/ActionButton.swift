//
//  ActionButton.swift
//  Drip
//
//  Created by Shane Chi on 2024/10/29.
//

import SwiftUI

struct ActionButton: View {
    var title: String
    var action: (() -> Void)?

    var body: some View {
        Button(action: {
            action?()
        }) {
            Text(title)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.white)
                .padding(.init(20))
                .frame(maxWidth: .infinity)
                .background(DripColor.main)
                .cornerRadius(20)
        }
      }
}

#Preview {
    ActionButton(title: "Button Title", action: nil)
        .padding()
}

