//
//  ChallengePoolScreen.swift
//  Drip
//
//  Created by Shane Chi on 2024/10/31.
//

import SwiftUI

struct ChallengePoolScreen: View {
    @State private var isPresentingProfileScreen = false

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    isPresentingProfileScreen = true
                }) {
                    ProfileChip()
                }
            }
            Spacer()
        }
        .padding(.init(top: 16, leading: 20, bottom: 0, trailing: 20))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(DripColor.backgroundGrey.ignoresSafeArea())
        .sheet(isPresented: $isPresentingProfileScreen, onDismiss: {
            isPresentingProfileScreen = false
        }) {
            ProfileScreen()
        }
    }
}

#Preview {
    ChallengePoolScreen()
}
