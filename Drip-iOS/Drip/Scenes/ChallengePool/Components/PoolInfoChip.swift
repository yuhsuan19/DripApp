//
//  PoolInfoChip.swift
//  Drip
//
//  Created by Shane Chi on 2024/11/2.
//

import SwiftUI

struct PoolInfoChip: View {
    @State var mainText: String
    @State var subText: String
    var body: some View {
        VStack(spacing: 4) {
            Text(mainText)
                .font(.system(size: 36, weight: .bold))
                .foregroundStyle(DripColor.primary500Primary)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .frame(height: 40)
            Text(subText)
                .font(.system(size: 12, weight: .regular))
                .foregroundStyle(DripColor.primary500Disabled)
                .frame(height: 16)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    PoolInfoChip(mainText: "1,500", subText: "USDC Staked")
}
