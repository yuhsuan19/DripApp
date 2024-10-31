//
//  TextInputField.swift
//  Drip
//
//  Created by Shane Chi on 2024/10/29.
//

import SwiftUI

struct TextInputField: View {
    @Binding var text: String
    var placeholder: String
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(DripColor.lightText)
                    .font(.system(size: 14))
                    .padding(.leading, 24)
            }
            TextField(placeholder, text: $text)
                .padding(.init(24))
                .background(DripColor.lightSub.opacity(0.15))
                .cornerRadius(12)
                .font(.system(size: 14))
        }
    }
}

struct TextInputField_Previews: PreviewProvider {
    @State static var sampleText: String = ""

    static var previews: some View {
        TextInputField(text: $sampleText, placeholder: "Enter text here")
            .padding()
    }
}
