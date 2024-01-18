//
//  FeedbackRouter.swift
//  LingvaVestra
//

import Foundation

protocol FeedbackRouterProtocol {
    /// Navigate to the profile screen.
    func routToProfile()
}

final class FeedbackRouter {

    // MARK: - Dependencies

    private weak var view: FeedbackViewProtocol?

    // MARK: - init

    init(view: FeedbackViewProtocol) {
        self.view = view
    }
}

// MARK: - Router Protocol

extension FeedbackRouter: FeedbackRouterProtocol {
    /// Navigate to the profile screen.
    func routToProfile() {
        view?.popToRoot(animated: true)
    }
}
