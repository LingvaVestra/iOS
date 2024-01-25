//
//  FeedbackAssembler.swift
//  LingvaVestra
//

final class FeedbackAssembler {

    /// Assembly the main components for the main screen.
    ///
    /// - Returns: An instance of `FeedbackViewController` configured with its associated presenter and router.
    func assembly() -> FeedbackViewController {
        let view = FeedbackViewController()
        let router = FeedbackRouter(view: view)
        let presenter = FeedbackPresenter(view: view, router: router)

        view.presenter = presenter

        return view
    }
}
