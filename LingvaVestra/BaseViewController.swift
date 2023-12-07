//
//  BaseViewController.swift
//  LingvaVestra
//
//  Created by Sergey Pavlov on 07.12.2023.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupSubviews()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        updateSubviews()
        updateConstraints()
    }
}

// MARK: - UITabBarController

extension BaseViewController {

    func setupTabBar(hidden: Bool) {
        tabBarController?.tabBar.isHidden = hidden
    }

    func switchTabBar(to index: Int) {
        tabBarController?.selectedIndex = index
    }
}

// MARK: - UINavigationController

extension BaseViewController {
    func setupNavigationBar(color: UIColor = .systemBackground) {
        navigationController?.navigationBar.barTintColor = color
    }

    func setupNavigationBar(hidden: Bool, animated: Bool = true) {
        navigationController?.setNavigationBarHidden(hidden, animated: animated)
    }

    func pushViewController(_ viewController: UIViewController, animated: Bool = true) {
        navigationController?.pushViewController(viewController, animated: animated)
    }

    func popViewController(animated: Bool = true) {
        navigationController?.popViewController(animated: animated)
    }

    func popToRoot(animated: Bool = true) {
        navigationController?.popToRootViewController(animated: animated)
    }

    func presentViewController(_ viewController: UIViewController, presentationStyle: UIModalPresentationStyle = .fullScreen, animated: Bool = true, completionHandler: (() -> Void)? = nil) {
        viewController.modalPresentationStyle = presentationStyle
        present(viewController, animated: animated, completion: completionHandler)
    }

    func dismissViewController(animated: Bool = true) {
        dismiss(animated: animated)
    }
}

// MARK: - Setup Subviews

extension BaseViewController {

    func setupSubviews() {
        view.backgroundColor = .systemBackground

        embedSubviews()
        setupConstraints()
    }

    func embedSubviews() {}
    func setupConstraints() {}
    func updateSubviews() {}
    func updateConstraints() {}
}
