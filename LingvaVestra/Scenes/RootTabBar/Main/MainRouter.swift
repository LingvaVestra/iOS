//
//  MainRouter.swift
//  LingvaVestra
//
//  Created by Sergey Pavlov on 12.12.2023.
//

import Foundation

protocol MainRouterProtocol {
    /// Navigate to the authentication screen.
    func routToAuth()
}

final class MainRouter {

    // MARK: - Dependencies

    private var navigationManager: NavigationProtocol

    // MARK: - init
    init(navigationManager: NavigationProtocol) {
        self.navigationManager = navigationManager
    }
}

// MARK: - Router Protocol

extension MainRouter: MainRouterProtocol {
    /// Navigate to the authentication screen.
    func routToAuth() {
        navigationManager.navigate(.auth)
    }
}
