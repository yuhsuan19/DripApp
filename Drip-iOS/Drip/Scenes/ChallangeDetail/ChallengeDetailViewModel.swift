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
    @Published var challenge: DripChallenge
    let rpcService: RPCService

    private lazy var challengeContract = DripChallengeContract(rpcService: rpcService, contractAddress: DripContracts.challenge)

    init(challenge: DripChallenge, rpcService: RPCService) {
        self.challenge = challenge
        self.rpcService = rpcService
    }

    func fetchChallengeDetail() {
        Task {
            if let challenge = await challengeContract.getChallengeDetail(tokenId: challenge.rawId) {
                DispatchQueue.main.sync { [weak self] in
                    guard let self = self else { return }
                    self.challenge = challenge
                }
            }
        }
    }

    func submitDailyCheck() {
        let dayIndex = getTodayIndex()
        Task {
            let result = await challengeContract.submitDailyCheck(tokenId: challenge.rawId, day: UInt16(dayIndex))
            if result {
                print("Submit daily check success")
            }
        }

    }

    private func getTodayIndex() -> Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd"
        let today = dateFormatter.string(from: Date())

        if let index = challenge.displayDates.firstIndex(of: today) {
            return index
        }
        return -1
    }
}
