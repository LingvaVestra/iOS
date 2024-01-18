//
//  ProfilePresenter.swift
//  LingvaVestra
//

import Foundation

protocol ProfilePresenterProtocol: BasePresenterProtocol {
    /// Array containing the settings items displayed in the settingsTableView.
    var items: [SettingsItem] { get }
    
    /// Called when the settingsTableView row is tapped.
    func didSelectSettingsRow(item: SettingsItem)
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
    
    /// Array containing the settings items displayed in the settingsTableView.
    var items: [SettingsItem] {
        SettingsItem.allCases
    }
    
    /// Called when the settingsTableView row is tapped.
    func didSelectSettingsRow(item: SettingsItem) {
        switch item {
        case .rateApp:
            // TODO: Add logic when Design & Backend will be ready
            return
        case .feedback:
            router.routToFeedback()
        case .logout:
            KeychainManager.shared.removeAllData()
            router.routToAuth()
        case .deleteProfile:
            // TODO: Add logic when Design & Backend will be ready
            return
        }
    }
}
