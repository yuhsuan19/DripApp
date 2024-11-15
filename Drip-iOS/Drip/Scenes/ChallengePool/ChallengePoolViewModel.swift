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
    private lazy var challengeManagerContract = ChallengeManagerContract(rpcService: rpcService, contractAddress: DripContracts.challengeManager)

    init(rpcService: RPCService) {
        self.rpcService = rpcService
    }

    func fetchChallenges(refresh: Bool = false) {
        DispatchQueue.main.async {
            self.challenges = []
        }
        Task {
            let challenges = await profileContract.getChallenges()
            print(challenges)
            DispatchQueue.main.async {
                self.challenges = challenges
            }
            print("Fetch challenges. Count: \(challenges.count)")
        }
    }

    func fetchEpochInfo() {
        Task {
            await challengeManagerContract.getEpochInfo()
        }
    }
}
