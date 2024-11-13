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

    private lazy var dripERC20Contract = DripERC20Contract(rpcService: rpcService, contractAddress: DripContracts.dripERC20Token)
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

    func createChallenge() {
        print(DripProfileContract.profileId)
//        Task {
//            let isSuccessful = await dripERC20Contract.approveTransfer(amount:  BigUInt(2.23).multiplied(by: BigUInt(10).power(18)))
//            if isSuccessful {
//                let result = await profileContract.createChallenge()
//                print("Challenge creation result: \(result)")
//            }
//        }
    }
}
