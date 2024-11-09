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
    @FocusState private var isFocused: Bool

    var body: some View {
        ZStack(alignment: .leading) {
            TextField(placeholder, text: $text)
                .padding(.init(10 ))
                .background(isFocused ? DripColor.primary500Primary.opacity(0.03) : .white)
                .foregroundStyle(.black)
                .cornerRadius(8)
                .font(.system(size: 14))
                .overlay(
                     RoundedRectangle(cornerRadius: 8)
                        .stroke(isFocused ? DripColor.primary500Primary :
                            Color(red: 238 / 255, green: 238 / 255, blue: 238 / 255), lineWidth: 1)
                 )
                .focused($isFocused)

            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(DripColor.primary500Disabled)
                    .font(.system(size: 14))
                    .padding(.leading, 10)
            }
        }
    }
}

struct TextInputField_Previews: PreviewProvider {
    @State static var sampleText: String = ""

    static var previews: some View {
        VStack {
            TextInputField(text: $sampleText, placeholder: "Enter text here")
                .padding()
        }.background(DripColor.backgroundMain)
    }
}
