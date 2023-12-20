//
//  DictionaryViewController.swift
//  LingvaVestra
//

import UIKit
import SnapKit

private enum Constants {
    static let topPadding: CGFloat = 20.0
    static let logoutButtonWidth: CGFloat = 100.0
    static let logoutButtonHeight: CGFloat = 44.0
    static let logoutCornerRadius: CGFloat = 10.0
}

protocol DictionaryViewProtocol: BaseViewProtocol {
    /// Notifies that new data has been received.
    func didReceiveData()
}

final class DictionaryViewController: BaseViewController {
    // MARK: - Properties

    var presenter: DictionaryPresenterProtocol!

    private lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Logout", for: .normal)
        button.layer.cornerRadius = Constants.logoutCornerRadius
        button.backgroundColor = .gray
        button.addTarget(self, action: #selector(logoutDidTap), for: .touchUpInside)

        return button
    }()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewDidLoad()
    }

    // MARK: - Actions
    @objc
    private func logoutDidTap() {
        presenter.logoutDidTap()
    }
}

// MARK: - Setup Subviews

extension DictionaryViewController {

    override func setupSubviews() {
        super.setupSubviews()

        view.backgroundColor = .secondarySystemBackground
    }

    override func embedSubviews() {
        super.embedSubviews()

        view.addSubview(logoutButton)
    }

    override func setupConstraints() {
        super.setupConstraints()

        logoutButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(Constants.topPadding)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(CGSize(
                width: Constants.logoutButtonWidth,
                height: Constants.logoutButtonHeight)
            )
        }
    }
}

// MARK: - View Protocol

extension DictionaryViewController: DictionaryViewProtocol {
    /// Notifies that new data has been received.
    func didReceiveData() {
        // update Interface with data
    }
}
