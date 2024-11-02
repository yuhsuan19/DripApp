//
//  ChallengePoolScreen.swift
//  Drip
//
//  Created by Shane Chi on 2024/10/31.
//

import SwiftUI

struct ChallengePoolScreen: View {
    @State private var isPresentingProfileScreen = false
    let columns = [GridItem(spacing: 16), GridItem()]
    let colors = Color.generateRandomColors(count: 10)

    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Spacer()
                Button(action: {
                    isPresentingProfileScreen = true
                }) {
                    ProfileChip()
                }
            }
            Text("Pool Name")
                .font(.system(size: 48, weight: .black))
                .foregroundStyle(DripColor.main)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
            ScrollView {
                VStack(spacing: 24) {
                    HStack(spacing: 12) {
                        PoolInfoChip(mainText: "30", subText: "Days Remaining")
                        PoolInfoChip(mainText: "16", subText: "Participants")
                        PoolInfoChip(mainText: "1,500", subText: "USDC Staked")
                    }
                    LazyVGrid(columns: columns, spacing: 16, content: {
                        ForEach(colors, id: \.self) { color in
                            NavigationLink(destination: {
                                ChallengeDetailScreen()
                            }) {
                                VStack(spacing: 0) {
                                    color.aspectRatio(1, contentMode: .fill)
                                        .padding(.bottom, 10)
                                    Text("Challenge Name")
                                        .font(.system(size: 14, weight: .light))
                                        .foregroundStyle(DripColor.mainText)
                                        .padding(.horizontal, 12)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.bottom, 2)
                                    Text("30 USDC Staked")
                                        .font(.system(size: 12, weight: .thin))
                                        .foregroundStyle(DripColor.subText)
                                        .padding(.horizontal, 12)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                .padding(.bottom, 10)
                                .background(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                            }
                        }
                    })
                }
            }
            ActionButton(title: "Create New Challenge")
            Spacer().frame(height: 10)
        }
        .padding(.init(top: 16, leading: 24, bottom: 0, trailing: 24))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(DripColor.backgroundGrey.ignoresSafeArea())
        .sheet(isPresented: $isPresentingProfileScreen, onDismiss: {
            isPresentingProfileScreen = false
        }) {
            ProfileScreen()
        }
    }
}

extension Color {
    static func generateRandomColors(count: Int) -> [Color] {
        return (0..<count).map { _ in Color.random() }
    }

    static func random() -> Color {
        return Color(
            red: Double.random(in: 0...1),
            green: Double.random(in: 0...1),
            blue: Double.random(in: 0...1)
        )
    }
}

#Preview {
    ChallengePoolScreen()
}
