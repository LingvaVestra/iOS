//
//  MainConfigurator.swift
//  LingvaVestra
//
//  Created by Sergey Pavlov on 09.12.2023.
//

import Foundation

final class MainConfigurator {

    func configure() -> MainViewController {
        let view = MainViewController()
        let presenter = MainPresenter()
        let navigationManager = NavigationManager.shared

        view.presenter = presenter
        presenter.view = view
        presenter.navigationManager = navigationManager

        return view
    }
}
