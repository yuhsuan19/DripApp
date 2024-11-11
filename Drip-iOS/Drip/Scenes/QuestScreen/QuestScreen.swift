//
//  QuestScreen.swift
//  Drip
//
//  Created by Shane Chi on 2024/11/2.
//

import SwiftUI

struct QuestScreen: View {
    @State var isCompleteDailyQuest = false

    var body: some View {
        VStack {
            if isCompleteDailyQuest {
                QuestResultScreen()
            } else {
                QuestView {
                    isCompleteDailyQuest = true
                }
            }
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
