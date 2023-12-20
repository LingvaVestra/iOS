//
//  ProfileRouter.swift
//  LingvaVestra
//

import Foundation

protocol ProfileRouterProtocol {
    /// Navigate to the authentication screen.
    func routToAuth()
}

final class ProfileRouter {

    // MARK: - Dependencies

    private var navigationManager: NavigationProtocol

    // MARK: - init
    init(navigationManager: NavigationProtocol) {
        self.navigationManager = navigationManager
    }
}

// MARK: - Router Protocol

extension ProfileRouter: ProfileRouterProtocol {
    /// Navigate to the authentication screen.
    func routToAuth() {
        navigationManager.navigate(.auth)
    }
}
