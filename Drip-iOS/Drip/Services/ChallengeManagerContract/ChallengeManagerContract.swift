//
//  ChallengeManagerContract.swift
//  Drip
//
//  Created by Shane Chi on 2024/11/15.
//

import Foundation
import web3
import BigInt

final class ChallengeManagerContract {
    private let rpcService: RPCService
    private let contractAddress: EthereumAddress

    init(rpcService: RPCService, contractAddress: String) {
        self.rpcService = rpcService
        self.contractAddress = EthereumAddress(stringLiteral: contractAddress)
    }

    func getEpochInfo() async {
        do {
            let epochId = DripProfileContract.epochId
            let response = try await GetEpochInfo(
                contract: contractAddress,
                epochId: epochId
            ).call(
                withClient: rpcService.client,
                responseType: GetEpochInfoResponse.self
            )
        } catch {
            print(error)
        }
    }
}
