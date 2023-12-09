//
//  MainPresenter.swift
//  LingvaVestra
//
//  Created by Sergey Pavlov on 09.12.2023.
//

import Foundation

protocol MainPresenterProtocol: BasePresenterProtocol {
    func logoutDidTap()
}

final class MainPresenter {
    
    // MARK: - Properties
    
    weak var view: MainViewProtocol?
    
    var navigationManager: NavigationProtocol?
    
}

// MARK: - Presenter Protocol 

extension MainPresenter: MainPresenterProtocol {
    
    func viewDidLoad() {
        // Logic after loading view, get data from network
        view?.didReceiveData()
    }
    
    func logoutDidTap() {
        navigationManager?.navigate(.auth)
    }
}
