//
//  DictionaryRouter.swift
//  LingvaVestra
//

import Foundation

protocol DictionaryRouterProtocol {
    /// Navigate to the authentication screen.
    func routToAuth()
}

final class DictionaryRouter {

    // MARK: - Dependencies

    private var navigationManager: NavigationProtocol

    // MARK: - init
    
    init(navigationManager: NavigationProtocol) {
        self.navigationManager = navigationManager
    }
}

// MARK: - Router Protocol

extension DictionaryRouter: DictionaryRouterProtocol {
    /// Navigate to the authentication screen.
    func routToAuth() {
        navigationManager.navigate(.auth)
    }
}
