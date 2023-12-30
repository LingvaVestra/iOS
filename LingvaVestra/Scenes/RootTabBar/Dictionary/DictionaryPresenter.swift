//
//  DictionaryPresenter.swift
//  LingvaVestra
//

import Foundation

protocol DictionaryPresenterProtocol: BasePresenterProtocol {
    /// Called when the logout button is tapped.
    func logoutDidTap()
}

final class DictionaryPresenter {

    // MARK: - Dependencies

    weak var view: DictionaryViewProtocol?

    private var router: DictionaryRouterProtocol

    // MARK: - init
    
    init(view: DictionaryViewProtocol?, router: DictionaryRouterProtocol) {
        self.view = view
        self.router = router
    }
}

// MARK: - Presenter Protocol

extension DictionaryPresenter: DictionaryPresenterProtocol {

    func viewDidLoad() {
        // Logic after loading view, get data from network
        view?.didReceiveData()
    }

    /// Called when the logout button is tapped.
    func logoutDidTap() {
        KeychainManager.shared.removeAllData()
        router.routToAuth()
    }
}
