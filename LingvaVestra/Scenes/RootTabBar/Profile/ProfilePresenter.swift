//
//  ProfilePresenter.swift
//  LingvaVestra
//

import Foundation

protocol ProfilePresenterProtocol: BasePresenterProtocol {
    /// Called when the logout button is tapped.
    func logoutDidTap()
}

final class ProfilePresenter {

    // MARK: - Dependencies

    weak var view: ProfileViewProtocol?

    private var router: ProfileRouterProtocol

    // MARK: - init
    
    init(view: ProfileViewProtocol?, router: ProfileRouterProtocol) {
        self.view = view
        self.router = router
    }
}

// MARK: - Presenter Protocol

extension ProfilePresenter: ProfilePresenterProtocol {

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
