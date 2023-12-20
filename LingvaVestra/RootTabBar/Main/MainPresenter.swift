//
//  MainPresenter.swift
//  LingvaVestra
//
//  Created by Sergey Pavlov on 09.12.2023.
//

import Foundation

protocol MainPresenterProtocol: BasePresenterProtocol {
    /// Called when the logout button is tapped.
    func logoutDidTap()
}

final class MainPresenter {
    
    // MARK: - Dependencies
    
    weak var view: MainViewProtocol?
    
    private var router: MainRouterProtocol

    // MARK: - init
    init(view: MainViewProtocol?, router: MainRouterProtocol) {
        self.view = view
        self.router = router
    }
}

// MARK: - Presenter Protocol 

extension MainPresenter: MainPresenterProtocol {
    
    func viewDidLoad() {
        // Logic after loading view, get data from network
        view?.didReceiveData()
    }

    /// Called when the logout button is tapped.
    func logoutDidTap() {
        router.routToAuth()
    }
}
