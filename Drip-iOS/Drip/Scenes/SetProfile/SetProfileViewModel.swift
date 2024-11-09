//
//  SetProfileViewModel.swift
//  Drip
//
//  Created by Shane Chi on 2024/11/4.
//

import Foundation

private enum Constants {
    static let avatarBackgrounds = 0...1
    static let avatarBodies = 0...29
    static let avatarHeads = 0...233
    static let avatarGlasses = 0...20
    static let avatarAccessories = 0...136
}

final class SetProfileViewModel: ObservableObject {
    @Published var avatarBg = Int.random(in: Constants.avatarBackgrounds)
    @Published var avatarBody = Int.random(in: Constants.avatarBodies)
    @Published var avatarHead = Int.random(in: Constants.avatarHeads)
    @Published var avatarGlasses = Int.random(in: Constants.avatarGlasses)
    @Published var avatarAccessory = Int.random(in: Constants.avatarAccessories)

    func randomlyGenerateAvatar() {
        avatarBg = Int.random(in: Constants.avatarBackgrounds)
        avatarBody = Int.random(in: Constants.avatarBodies)
        avatarHead = Int.random(in: Constants.avatarHeads)
        avatarGlasses = Int.random(in: Constants.avatarGlasses)
        avatarAccessory = Int.random(in: Constants.avatarAccessories)
    }
}
