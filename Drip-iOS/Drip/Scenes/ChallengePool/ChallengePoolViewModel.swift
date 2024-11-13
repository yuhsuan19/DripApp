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
    @Published var challenges: [DripChallenge] = []

    let rpcService: RPCService

    private lazy var profileContract = DripProfileContract(rpcService: rpcService, contractAddress: DripContracts.profile)

    init(rpcService: RPCService) {
        self.rpcService = rpcService
    }

    func fetchChallenges() {
        Task {
            let challenges = await profileContract.getChallenges()
            DispatchQueue.main.async {
                self.challenges = challenges
            }
            print("Fetch challenges. Count: \(challenges.count)")
        }
    }
}
