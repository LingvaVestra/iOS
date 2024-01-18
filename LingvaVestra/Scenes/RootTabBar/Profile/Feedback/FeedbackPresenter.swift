//
//  FeedbackPresenter.swift
//  LingvaVestra
//

import Foundation

protocol FeedbackPresenterProtocol: BasePresenterProtocol {
    /// Called when the send button is tapped.
    func sendDidTap()
}

final class FeedbackPresenter {

    // MARK: - Dependencies

    weak var view: FeedbackViewProtocol?

    private var router: FeedbackRouterProtocol

    // MARK: - init

    init(view: FeedbackViewProtocol?, router: FeedbackRouterProtocol) {
        self.view = view
        self.router = router
    }
}

// MARK: - Presenter Protocol

extension FeedbackPresenter: FeedbackPresenterProtocol {

    func viewDidLoad() {
        // Logic after loading view, get data from network
        view?.didReceiveData()
    }

    /// Called when the send button is tapped.
    func sendDidTap() {
        // TODO: add logic after backend will be ready
        router.routToProfile()
    }
}
