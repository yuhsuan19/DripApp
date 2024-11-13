//
//  ChallengeDetailViewModel.swift
//  Drip
//
//  Created by Shane Chi on 2024/11/13.
//

import Foundation
import web3
import BigInt

final class ChallengeDetailViewModel: ObservableObject {
    @Published var challenge: DripChallenge?

    let tokenId: BigUInt
    let rpcService: RPCService

    private lazy var challengeContract = DripChallengeContract(rpcService: rpcService, contractAddress: DripContracts.challenge)

    init(tokenId: BigUInt, rpcService: RPCService) {
        self.tokenId = tokenId
        self.rpcService = rpcService
    }

    func fetchChallengeDetail() {
        Task {
            await challengeContract.getChallengeDetail(tokenId: tokenId)
        }
    }
}
