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
        VStack(spacing: 24) {
            // navi bar
            HStack {
                Button(action: {
                    dismiss()
                }, label: {
                    Image(.backWhite)
                        .resizable()
                        .clipped()
                        .frame(width: 22 ,height: 22)
                        .padding(.all, 8)
                })
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 16)
            .frame(height: 56)
            .background(.black)
            
            ScrollView {
                VStack(spacing: 12) {
                    Image(.challenge0)
                        .resizable()
                        .aspectRatio(1, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                        .overlay(RoundedRectangle(cornerRadius: 24).stroke(.black, lineWidth: 2))
                    HStack {
                        VStack(spacing: 6) {
                            Text("11/16")
                                .font(.system(size: 10))
                                .foregroundStyle(DripColor.primary500Disabled)
                            DripColor.primary500Primary
                                .frame(width: 16, height: 16)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        VStack(spacing: 6) {
                            Text("11/16")
                                .font(.system(size: 10))
                                .foregroundStyle(DripColor.primary500Disabled)
                            DripColor.primary500Primary
                                .frame(width: 16, height: 16)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        VStack(spacing: 6) {
                            Text("11/16")
                                .font(.system(size: 10))
                                .foregroundStyle(DripColor.primary500Disabled)
                            DripColor.primary500Primary
                                .frame(width: 16, height: 16)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        VStack(spacing: 6) {
                            Text("11/16")
                                .font(.system(size: 10))
                                .foregroundStyle(DripColor.primary500Disabled)
                            DripColor.primary500Primary
                                .frame(width: 16, height: 16)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        VStack(spacing: 6) {
                            Text("11/16")
                                .font(.system(size: 10))
                                .foregroundStyle(DripColor.primary500Disabled)
                            DripColor.primary500Primary
                                .frame(width: 16, height: 16)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.all, 16)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(.black, lineWidth: 2))
                    VStack(spacing: 4) {
                        Text("Challenges name")
                            .font(.custom("LondrinaSolid-Regular", size: 36))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.black)
                        Text("30 USDC Staked")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundStyle(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Spacer().frame(height: 2)
                        Text("This is a description This is a description This is a description This is a description This is a description This is a description")
                            .font(.system(size: 16, weight: .regular))
                            .foregroundStyle(DripColor.primary500Disabled)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .padding(.horizontal, 1.5)
                .padding(.top, 1.5)
            }
            .padding(.horizontal, 24)
            ActionButton(title: "Daily Quest") {
                isPresentingQuestScreen = true
            }
            .padding(.horizontal, 24)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.bottom, 20)
        .background(DripColor.backgroundMain.ignoresSafeArea())
        .navigationBarBackButtonHidden()
        .sheet(isPresented: $isPresentingQuestScreen) {
            QuestScreen()
        }
    }
}

#Preview {
    ChallengeDetailScreen()
}
