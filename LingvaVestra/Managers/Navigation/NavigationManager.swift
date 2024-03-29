//
//  NavigationManager.swift
//  LingvaVestra
//
//  Created by Sergey Pavlov on 08.12.2023.
//

import UIKit

enum Route {
    case auth
    case tabBar
}

protocol NavigationProtocol {
    /// Sets the main window for the app.
    ///
    /// - Parameters:
    ///   - window: The main window to be set for the app.
    ///   - completionHandler: A closure that is called after the window is set.
    func setWindow(_ window: UIWindow?, completionHandler: @escaping (Bool) -> Void)

    /// Navigates to a specific route
    func navigate(_ route: Route)
}

final class NavigationManager {

    // MARK: - Properties

    static let shared = NavigationManager()
    private var window: UIWindow?

    // MARK: - init

    private init() {}

}

// MARK: - NavigationProtocol

extension NavigationManager: NavigationProtocol {
    /// Sets the main window for the app.
    ///
    /// - Parameters:
    ///   - window: The main window to be set for the app.
    ///   - completionHandler: A closure that is called after the window is set.
    func setWindow(_ window: UIWindow?, completionHandler: @escaping (Bool) -> Void) {
        self.window = window
        let launchController = LaunchViewController()
        launchController.loadedLaunchHandler = completionHandler
        self.setRootController(launchController)
    }

    /// Navigates to the specified route.
    ///
    /// - Parameter route: The route to navigate to.
    ///     - If the route is  `.auth`, sets the AuthViewController as the root.
    ///     - If the route is `.tabBar`, sets the TabBarController as the root.
    func navigate(_ route: Route) {
        switch route {
        case .auth:
            setRootController(createAuthViewController())
        case .tabBar:
            setRootController(createRootTabBarController())
        }
    }
}

// MARK: - Private methods

private extension NavigationManager {

    func setRootController(_ controller: UIViewController) {
        guard let window = window else { return }
        window.rootViewController = controller
        window.makeKeyAndVisible()
    }

    func createAuthViewController() -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: AuthViewController())
        return navigationController
    }

    func createRootTabBarController() -> UITabBarController {
        BaseTabBarController(barType: .root)
    }
}
