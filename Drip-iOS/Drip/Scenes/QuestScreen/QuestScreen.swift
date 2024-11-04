//
//  QuestScreen.swift
//  Drip
//
//  Created by Shane Chi on 2024/11/2.
//

import SwiftUI

struct QuestScreen: View {
    var body: some View {
        VStack {
            QuestView()
        }
        .padding(.horizontal, 24)
        .padding(.top, 24)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(DripColor.backgroundGrey.ignoresSafeArea())
    }
}

#Preview {
    QuestScreen()
}
