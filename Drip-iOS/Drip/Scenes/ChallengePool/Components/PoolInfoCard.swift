//
//  PoolInfoCard.swift
//  Drip
//
//  Created by Shane Chi on 2024/11/11.
//

import SwiftUI

struct PoolInfoCard: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 20) {
                VStack(spacing: 4) {
                    Text("Pool Name")
                        .font(.custom("LondrinaSolid-Regular", size: 36))
                        .foregroundStyle(.black)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Pool description. Pool description. Pool description. Pool description.")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundStyle(DripColor.primary500Disabled)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                Image(.poolActive)
                    .resizable()
                    .frame(width: 98, height: 80)
            }
            .frame(maxWidth: .infinity)
            .padding(.all, 16)
            .background(DripColor.activePoolBg)
            HStack {
                PoolInfoChip(mainText: "30", subText: "Days Remaining")
                PoolInfoChip(mainText: "16", subText: "Participants")
                PoolInfoChip(mainText: "1,500", subText: "USDC Staked")
            }
            .padding(.all, 16)
            .background(.white)
        }
        .frame(maxWidth: .infinity)
        .padding(.all, 0)
        .background(.clear)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 2)
        )
    }
}

#Preview {
    VStack {
        PoolInfoCard()
    }
    .padding()
    .background(DripColor.backgroundMain)
}
