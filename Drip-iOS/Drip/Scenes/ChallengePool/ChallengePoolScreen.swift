//
//  ChallengePoolScreen.swift
//  Drip
//
//  Created by Shane Chi on 2024/10/31.
//

import SwiftUI

struct ChallengePoolScreen: View {
    @StateObject private var viewModel: ChallengePoolViewModel
    @State private var isPresentingProfileScreen = false
    let columns = [GridItem(spacing: 16), GridItem()]
    let colors = Color.generateRandomColors(count: 10)

    init(viewModel: ChallengePoolViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .center) {
                Image(.naviBarLogo)
                    .resizable()
                    .frame(width: 80, height: 32)
                Spacer()
                Button(action: {
                    isPresentingProfileScreen = true
                }) {
                    Image(.userProfile)
                        .resizable()
                        .frame(width: 32, height: 32)
                }
            }
            .padding(.horizontal, 16)
            .frame(height: 56)
            .frame(maxWidth: .infinity)
            .background(.black)
            .padding(.bottom, 0)

            VStack(spacing: 10) {
                Text("Pool Name")
                    .font(.system(size: 48, weight: .black))
                    .foregroundStyle(DripColor.main)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                ScrollView(showsIndicators: false) {
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
            .padding(.init(top: 0, leading: 24, bottom: 0, trailing: 24))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(DripColor.backgroundGrey.ignoresSafeArea())
            .sheet(isPresented: $isPresentingProfileScreen) {
                let viewModel = ProfileViewModel(rpcService: viewModel.rpcService)
                ProfileScreen(viewModel: viewModel)
            }
        }
    }
}
