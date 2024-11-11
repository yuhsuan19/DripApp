//
//  DripChallenge.swift
//  Drip
//
//  Created by Shane Chi on 2024/11/10.
//

import Foundation
import web3
import BigInt

struct DripChallenge: ABITuple {
    static var types: [ABIType.Type] { [
        BigUInt.self,
        BigUInt.self,
        BigUInt.self,
        BigUInt.self,
        BigUInt.self,
        EthereumAddress.self,
        EthereumAddress.self,
        UInt16.self,
        String.self,
        String.self,
        BigUInt.self,
        BigUInt.self,
        BigUInt.self,
        BigUInt.self,
        BigUInt.self
    ] }

    let rawId: BigUInt
    let rawEpochId: BigUInt
    let stakeAmount: BigUInt
    let startTime: BigUInt
    let endTime: BigUInt
    let owner: EthereumAddress
    let stakeToken: EthereumAddress
    let durationInDays: UInt16
    let title: String
    let desc: String
    var dailyCompletionTimestamps: [BigUInt] = []

    init(
        rawId: BigUInt,
        rawEpochId: BigUInt,
        stakeAmount: BigUInt,
        startTime: BigUInt,
        endTime: BigUInt,
        owner: EthereumAddress,
        stakeToken: EthereumAddress,
        durationInDays: UInt16,
        title: String,
        desc: String,
        dailyCompletionTimestamps: [BigUInt]
    ) {
        self.rawId = rawId
        self.rawEpochId = rawEpochId
        self.stakeAmount = stakeAmount
        self.startTime = startTime
        self.endTime = endTime
        self.owner = owner
        self.stakeToken = stakeToken
        self.durationInDays = durationInDays
        self.title = title
        self.desc = desc
        self.dailyCompletionTimestamps = dailyCompletionTimestamps
    }

    init?(values: [ABIDecoder.DecodedValue]) throws {
        self.rawId = try values[0].decoded()
        self.rawEpochId = try values[1].decoded()
        self.stakeAmount =  try values[2].decoded()
        self.startTime =  try values[3].decoded()
        self.endTime =  try values[4].decoded()
        self.owner = try values[5].decoded()
        self.stakeToken =  try values[6].decoded()
        self.durationInDays =  try values[7].decoded()
        self.title =  try values[8].decoded()
        self.desc =  try values[9].decoded()

        for idx in 10..<10+Int(self.durationInDays) {
            self.dailyCompletionTimestamps.append(try values[idx].decoded())
        }
    }

    func encode(to encoder: ABIFunctionEncoder) throws {
        try encoder.encode(rawId)
        try encoder.encode(rawEpochId)
        try encoder.encode(stakeAmount)
        try encoder.encode(startTime)
        try encoder.encode(endTime)
        try encoder.encode(owner)
        try encoder.encode(stakeToken)
        try encoder.encode(durationInDays)
        try encoder.encode(title)
        try encoder.encode(desc)
        try encoder.encode(dailyCompletionTimestamps)
    }

    var encodableValues: [ABIType] { [
        rawId,
        rawEpochId,
        stakeAmount,
        startTime,
        endTime,
        owner,
        stakeToken,
        durationInDays,
        title,
        desc,
        ABIArray(values: dailyCompletionTimestamps)
    ] }
}

extension DripChallenge: Identifiable {
    var id: String {
        return rawId.description
    }
}