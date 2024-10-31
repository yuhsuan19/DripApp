//
//  LaunchScreen.swift
//  Drip
//
//  Created by Shane Chi on 2024/10/19.
//

import SwiftUI

struct LaunchScreen: View {
    var setUpCompletion: (() -> Void)?

    @StateObject private var viewModel: LaunchViewModel

    init(viewModel: LaunchViewModel, setUpCompletion: (() -> Void)? = nil) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.setUpCompletion = setUpCompletion
    }

    var body: some View {
        VStack {
            Image(.dripLogoFull)
                .resizable()
                .frame(width: 140, height: 140)
                .padding(.init(top: 0, leading: 0, bottom: 12, trailing: 0))
            Text("Drip")
                .font(.system(size: 32, weight: .bold))
                .foregroundStyle(DripColor.main)
                .padding(.init(top: 0, leading: 0, bottom: 1, trailing: 0))
            Text("Never Drop")
                .font(.system(size: 16, weight: .thin))
                .foregroundStyle(DripColor.mainText)
            Spacer()
                .frame(height: 60)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(DripColor.backgroundGrey.ignoresSafeArea())
        .onAppear {
            viewModel.setUp()
        }
        .onChange(of: viewModel.isSetUpComplete) {
            if viewModel.isSetUpComplete {
                setUpCompletion?()
            }
        }
    }
}

#Preview {
    let viewModel = LaunchViewModel(web3AuthService: Web3AuthService())
    return LaunchScreen(viewModel: viewModel)
}
