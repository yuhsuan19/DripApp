//
//  DripApp.swift
//  Drip
//
//  Created by Shane Chi on 2024/10/19.
//

import SwiftUI
import SwiftData

@main
struct DripApp: App {
    private let web3AuthService: Web3AuthService = Web3AuthService()

    @State private var userSessionState: UserSessionState = .launching

    var body: some Scene {
        WindowGroup {
            switch userSessionState {
            case .launching:
                configLaunchScreen()
            case .guest:
                NavigationStack {
                    configSignInScreen()
                }
            case .active:
                NavigationStack {
                    ChallengePoolScreen()
                }
            }
        }
    }

    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
}

// MARK: - Private functions
extension DripApp {
    private func configLaunchScreen() -> LaunchScreen {
        let viewModel = LaunchViewModel(web3AuthService: web3AuthService)
        let launchScreen = LaunchScreen(viewModel: viewModel) {
            if let user = web3AuthService.user {
                let rpcService = RPCService(user: user, rpcURL: BlockchainEnv.rpcURL, chainId: BlockchainEnv.chainId)
                let profileContract = DripProfileContract(rpcService: rpcService!, contractAddress: DripContracts.profile)
                Task {
                    let result = await profileContract.getProfile()
                    DispatchQueue.main.async {
                        switch result {
                        case .success:
                            userSessionState = .active
                        case .failure:
                            userSessionState = .guest
                        }
                    }
                }
            } else {
                userSessionState = .guest
            }
        }
        return launchScreen
    }

    private func configSignInScreen() -> SignInScreen {
        let viewModel = SignInViewModel(web3AuthService: web3AuthService)
        let sigInScreen = SignInScreen(viewModel: viewModel) {
            userSessionState = .active
        }
        return sigInScreen
    }
}
