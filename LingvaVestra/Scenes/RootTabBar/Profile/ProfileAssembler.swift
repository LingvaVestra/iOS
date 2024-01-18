//
//  ProfileAssembler.swift
//  LingvaVestra
//

final class ProfileAssembler {

    /// Assembly the main components for the main screen.
    ///
    /// - Returns: An instance of `ProfileViewController` configured with its associated presenter and router.
    func assembly() -> ProfileViewController {
        let view = ProfileViewController()
        let navigationManager = NavigationManager.shared
        let router = ProfileRouter(navigationManager: navigationManager, view: view)
        let presenter = ProfilePresenter(view: view, router: router)

        view.presenter = presenter

        return view
    }
}
