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
        VStack {
            Text(mainText)
                .font(.system(size: 46, weight: .bold))
                .foregroundStyle(DripColor.mainText)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .frame(height: 50)
            Text(subText)
                .font(.system(size: 14, weight: .thin))
                .foregroundStyle(DripColor.subText)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    PoolInfoChip(mainText: "1,500", subText: "USDC Staked")
}
