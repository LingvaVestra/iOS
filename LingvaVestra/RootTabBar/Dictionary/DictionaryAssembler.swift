//
//  DictionaryAssembler.swift
//  LingvaVestra
//

final class DictionaryAssembler {

    /// Assembly the main components for the main screen.
    ///
    /// - Returns: An instance of `DictionaryViewController` configured with its associated presenter and router.
    func assembly() -> DictionaryViewController {
        let view = DictionaryViewController()
        let navigationManager = NavigationManager.shared
        let router = DictionaryRouter(navigationManager: navigationManager)
        let presenter = DictionaryPresenter(view: view, router: router)

        view.presenter = presenter

        return view
    }
}
