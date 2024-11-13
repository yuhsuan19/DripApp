//
//  DripChallengeContract.swift
//  Drip
//
//  Created by Shane Chi on 2024/11/13.
//

import Foundation
import web3
import BigInt

final class DripChallengeContract {
    private let rpcService: RPCService
    private let contractAddress: EthereumAddress

    init(rpcService: RPCService, contractAddress: String) {
        self.rpcService = rpcService
        self.contractAddress = EthereumAddress(stringLiteral: contractAddress)
    }
}
