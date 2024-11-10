//
//  ProfileViewModel.swift
//  Drip
//
//  Created by Shane Chi on 2024/11/10.
//

import Foundation
import Web3Auth

final class ProfileViewModel: ObservableObject {
    let rpcService: RPCService

    @Published var avatarComponents: [Int]?
    @Published var userHandle: String?
    var accountAddress: String { rpcService.accountAddress }
    var email: String? { (rpcService.user as? Web3AuthState)?.userInfo?.email }

    private lazy var profileContract = DripProfileContract(
        rpcService: rpcService,
        contractAddress: DripContracts.profile
    )

    init(rpcService: RPCService) {
        self.rpcService = rpcService
        fetchProfile()
    }

    func fetchProfile() {
        Task {
            let result = await profileContract.getProfile()
            switch result {
            case let .success(profile):
                DispatchQueue.main.async { [weak self] in
                    guard let self else { return }
                    self.userHandle = profile.rawUserHandle
                    self.avatarComponents = profile.rawAvatars.map { Int($0) }
                }
            case .failure:
                print("Failed to fetch profile")
            }
        }
    }
}
