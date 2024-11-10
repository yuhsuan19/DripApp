//
//  ChallengePoolViewModel.swift
//  Drip
//
//  Created by Shane Chi on 2024/11/10.
//

import Foundation
import web3
import BigInt

final class ChallengePoolViewModel: ObservableObject {
    let rpcService: RPCService
    private lazy var dripERC20Contract = DripERC20Contract(
        rpcService: rpcService,
        contractAddress: EthereumAddress(DripContracts.dripERC20Token)
    )
    private lazy var profileContract = DripProfileContract(rpcService: rpcService, contractAddress: DripContracts.profile)

    init(rpcService: RPCService) {
        self.rpcService = rpcService
    }

    func createChallenge() {
        Task {
//            await profileContract.getChallenges()
//            let isSuccessful = await dripERC20Contract.approveTransfer(amount: BigUInt(100_000) )
//            if isSuccessful {
//                let result = await profileContract.createChallenge()
//                print("Challenge creation result: \(result)")
//            }
        }
    }
}
