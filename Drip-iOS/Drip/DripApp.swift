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
                configSignInScreen()
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
            userSessionState = (web3AuthService.user == nil) ? .guest : .active
        }
        return launchScreen
    }

    private func configSignInScreen() -> SignInScreen {
        let viewModel = SignInViewModel(web3AuthService: web3AuthService)
        let sigInScreen = SignInScreen(viewModel: viewModel)
        return sigInScreen
    }
}
