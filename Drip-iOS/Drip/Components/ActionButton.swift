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
    let backgroundColor: Color

    init(title: String, backgroundColor: Color = DripColor.main, action: (() -> Void)? = nil) {
        self.title = title
        self.backgroundColor = backgroundColor
        self.action = action
    }

    var body: some View {
        Button(action: {
            action?()
        }) {
            Text(title)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.white)
                .padding(.init(20))
                .frame(maxWidth: .infinity)
                .background(backgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }
      }
}

#Preview {
    ActionButton(
        title: "Button Title",
        backgroundColor: DripColor.warning,
        action: nil
    )
    .padding()
}

