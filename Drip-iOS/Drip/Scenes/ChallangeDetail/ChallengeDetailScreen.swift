//
//  ChallengeDetailScreen.swift
//  Drip
//
//  Created by Shane Chi on 2024/11/2.
//

import SwiftUI

struct ChallengeDetailScreen: View {
    @Environment(\.dismiss) var dismiss
    @State private var isPresentingQuestScreen = false

    private let color = Color.random()
    var body: some View {
        VStack {
            TopToolBar()
            ScrollView {
                VStack {
                    color.aspectRatio(1, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    VStack {
                        Text("Challenge Name")
                    }
                    .padding(.init(top: 16, leading: 24, bottom: 0, trailing: 24))
                }
            }
            ActionButton(title: "Daily Quest") {
                isPresentingQuestScreen = true
            }.padding(.horizontal, 24)
            Spacer().frame(height: 10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(DripColor.backgroundGrey.ignoresSafeArea())
        .navigationBarBackButtonHidden()
        .sheet(isPresented: $isPresentingQuestScreen, onDismiss: {
//            isPresentingQuestScreen = false
        }) {
            QuestScreen()
        }
    }
}

#Preview {
    ChallengeDetailScreen()
}
