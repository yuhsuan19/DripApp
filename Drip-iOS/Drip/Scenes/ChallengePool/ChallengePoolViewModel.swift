//
//  ChallengePoolViewModel.swift
//  Drip
//
//  Created by Shane Chi on 2024/11/10.
//

import Foundation

final class ChallengePoolViewModel: ObservableObject {
    let rpcService: RPCService

    init(rpcService: RPCService) {
        self.rpcService = rpcService
    }
}
