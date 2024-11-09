//
//  GetProfileByAddress.swift
//  Drip
//
//  Created by Shane Chi on 2024/11/9.
//

import Foundation
import web3
import BigInt

struct GetProfile: ABIFunction {
    static let name = "getProfileByOwner"

    let contract: web3.EthereumAddress
    let gasPrice: BigUInt? = nil
    let gasLimit: BigUInt? = nil
    let from: web3.EthereumAddress? = nil

    private let ownerAddr: EthereumAddress


    init(contract: web3.EthereumAddress, ownerAddr: EthereumAddress) {
        self.contract = contract
        self.ownerAddr = ownerAddr
    }

    public func encode(to encoder: web3.ABIFunctionEncoder) throws {
        try encoder.encode(ownerAddr)
    }
}
