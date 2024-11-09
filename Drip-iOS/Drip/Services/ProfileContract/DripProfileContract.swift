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

    func getProfile() async -> Result<DripProfile, Error> {
        do {
            let response = try await GetProfile(
                contract: EthereumAddress(stringLiteral: DripContracts.profile),
                ownerAddr: rpcService.rawAddress
            ).call(withClient: rpcService.client, responseType: GetProfileResponse.self)
            let profile = response.profile
            return .success(profile)
        } catch {
            print("Fail to get profile: \(error)")
            return .failure(error)
        }
    }
}
