//
//  ProfileRouter.swift
//  LingvaVestra
//

import Foundation

protocol ProfileRouterProtocol {
    /// Navigate to the authentication screen.
    func routToAuth()

    /// Navigates to Feedback ViewController
    func routToFeedback()
}

final class ProfileRouter {

    // MARK: - Dependencies

    private var navigationManager: NavigationProtocol

    private weak var view: ProfileViewProtocol?

    // MARK: - init
    init(navigationManager: NavigationProtocol, view: ProfileViewProtocol) {
        self.navigationManager = navigationManager
        self.view = view
    }
}

// MARK: - Router Protocol

extension ProfileRouter: ProfileRouterProtocol {
    /// Navigate to the authentication screen.
    func routToAuth() {
        navigationManager.navigate(.auth)
    }
    /// Navigates to Feedback ViewController
    func routToFeedback() {
        let feedbackVC = FeedbackAssembler().assembly()
        view?.pushViewController(feedbackVC, animated: true)
    }
}
