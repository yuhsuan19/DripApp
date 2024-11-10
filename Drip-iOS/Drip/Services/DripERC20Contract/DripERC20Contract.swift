//
//  DripERC20Contract.swift
//  Drip
//
//  Created by Shane Chi on 2024/11/10.
//

import Foundation
import web3
import BigInt

final class DripERC20Contract {
    private let rpcService: RPCService
    private let contractAddress: EthereumAddress
    private lazy var erc20: ERC20 = ERC20(client: rpcService.client)

    init(rpcService: RPCService, contractAddress: EthereumAddress) {
        self.rpcService = rpcService
        self.contractAddress = contractAddress
    }

    func approveTransfer(
        spender: EthereumAddress = EthereumAddress(DripContracts.challenge),
        amount: BigUInt
    ) async -> Bool {
        let function = ERC20Functions.approve(
            contract: contractAddress,
            from: rpcService.rawAddress,
            spender: spender,
            value: amount
        )
        let result = await rpcService.sendTransaction(function)
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
