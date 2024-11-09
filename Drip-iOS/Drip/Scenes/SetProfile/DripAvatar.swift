//
//  DripAvatar.swift
//  Drip
//
//  Created by Shane Chi on 2024/11/4.
//

import SwiftUI

struct DripAvatar: View {
    let bg: Int
    let bd: Int
    let hd: Int
    let gls: Int
    let acc: Int
    let size: CGFloat

    var body: some View {
        ZStack {
            AvatarLayer(imageName: "bg-\(bg)")
            AvatarLayer(imageName: "body-\(bd)")
            AvatarLayer(imageName: "head-\(hd)")
            AvatarLayer(imageName: "glasses-\(gls)")
        }
        .frame(width: size, height: size)
        .clipShape(Circle())
        .overlay(
            Circle().stroke(DripColor.main, lineWidth: 4)
        )
    }
}

struct AvatarLayer: View {
    let imageName: String

    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
    }
}

#Preview {
    DripAvatar(bg: 1, bd: 1, hd: 7, gls: 4, acc: 1, size: 200)
}
