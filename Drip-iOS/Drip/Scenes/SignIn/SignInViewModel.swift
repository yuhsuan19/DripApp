//
//  SignInViewModel.swift
//  Drip
//
//  Created by Shane Chi on 2024/10/27.
//

import Foundation
import Combine

final class SignInViewModel: ObservableObject {
    @Published var isSignedIn: Bool = false
    @Published var needToSetProfile: Bool = false

    private let web3AuthService: Web3AuthService
    private var cancellables = Set<AnyCancellable>()

    init(web3AuthService: Web3AuthService) {
        self.web3AuthService = web3AuthService
        setUpBinding()
    }

    func signIn(with email: String) {
        Task {
            await web3AuthService.login(with: email)
        }
    }

    func mockSetProfile() {
        needToSetProfile = true
    }
}

extension SignInViewModel {
    private func setUpBinding() {
        web3AuthService.logInSuccessSubject
            .sink { [weak self] in
                guard let self else { return }
                DispatchQueue.main.async {
                    self.isSignedIn = true
                }
            }
            .store(in: &cancellables)
    }
}
