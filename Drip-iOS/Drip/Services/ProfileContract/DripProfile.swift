//
//  DripProfile.swift
//  Drip
//
//  Created by Shane Chi on 2024/11/9.
//

import Foundation
import web3
import BigInt

struct DripProfile: ABITuple {
    static var types: [ABIType.Type] { [
        BigInt.self, // token id
        EthereumAddress.self, // owner
        String.self,  // user handle
        BigInt.self, // bg
        BigInt.self, // bd
        BigInt.self, // hd
        BigInt.self, // gls
        BigInt.self // acc
    ] }

    var rawTokenId: BigInt
    var rawOwnerAddress: EthereumAddress
    var rawUserHandle: String
    var rawAvatarBg: BigInt
    var rawAvatarBody: BigInt
    var rawAvatarHead: BigInt
    var rawAvatarGlasses: BigInt
    var rawAvatarAccessory: BigInt

    init(
        rawTokenId: BigInt,
        rawOwnerAddress: EthereumAddress,
        rawUserHandle: String,
        rawAvatarBg: BigInt,
        rawAvatarBody: BigInt,
        rawAvatarHead: BigInt,
        rawAvatarGlasses: BigInt,
        rawAvatarAccessory: BigInt
    ) {
        self.rawTokenId = rawTokenId
        self.rawOwnerAddress = rawOwnerAddress
        self.rawUserHandle = rawUserHandle
        self.rawAvatarBg = rawAvatarBg
        self.rawAvatarBody = rawAvatarBody
        self.rawAvatarHead = rawAvatarHead
        self.rawAvatarGlasses = rawAvatarGlasses
        self.rawAvatarAccessory = rawAvatarAccessory
    }

    init?(values: [ABIDecoder.DecodedValue]) throws {
        self.rawTokenId = try values[0].decoded()
        self.rawOwnerAddress = try values[1].decoded()
        self.rawUserHandle = try values[2].decoded()
        self.rawAvatarBg = try values[3].decoded()
        self.rawAvatarBody = try values[4].decoded()
        self.rawAvatarHead = try values[5].decoded()
        self.rawAvatarGlasses = try values[6].decoded()
        self.rawAvatarAccessory = try values[7].decoded()
    }

    func encode(to encoder: ABIFunctionEncoder) throws {
        try encoder.encode(rawTokenId)
        try encoder.encode(rawOwnerAddress)
        try encoder.encode(rawUserHandle)
        try encoder.encode(rawAvatarBg)
        try encoder.encode(rawAvatarBody)
        try encoder.encode(rawAvatarHead)
        try encoder.encode(rawAvatarGlasses)
        try encoder.encode(rawAvatarAccessory)
    }

    var encodableValues: [ABIType] { [
        rawTokenId,
        rawOwnerAddress,
        rawUserHandle,
        rawAvatarBg,
        rawAvatarBody,
        rawAvatarHead,
        rawAvatarGlasses,
        rawAvatarAccessory
    ] }
}
