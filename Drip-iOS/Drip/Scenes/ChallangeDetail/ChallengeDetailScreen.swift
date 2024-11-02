//
//  ChallengeDetailScreen.swift
//  Drip
//
//  Created by Shane Chi on 2024/11/2.
//

import SwiftUI

struct ChallengeDetailScreen: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Button("Back") {
                       dismiss() // 返回上一頁
                   }
                   .padding()
                   .foregroundColor(.blue)
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ChallengeDetailScreen()
}
