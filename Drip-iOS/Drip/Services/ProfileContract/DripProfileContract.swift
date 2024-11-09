//
//  ProfileContract.swift
//  Drip
//
//  Created by Shane Chi on 2024/11/9.
//

import Foundation
import web3

final class DripProfileContract {
    private let rpcService: RPCService
    private let contractAddress: EthereumAddress

    init(rpcService: RPCService, contractAddress: String) {
        self.rpcService = rpcService
        self.contractAddress = EthereumAddress(stringLiteral: contractAddress)
    }

    func createProfile(userHandle: String, avatarComponents: [Int]) async -> Bool {
        let createProfileFunction = CreateProfile(
            from: rpcService.rawAddress,
            contract: contractAddress,
            ownerAddress: rpcService.accountAddress,
            userHandle: userHandle, avatarComponents: avatarComponents
        )
        let result = await rpcService.sendTransaction(createProfileFunction)
        switch result {
        case let .success(txHash):
            await rpcService.waitForTxSuccess(txHash: txHash)
            return true
        case let .failure(error):
            print("Fail to create profile: \(error)")
            return false
        }
    }
}
