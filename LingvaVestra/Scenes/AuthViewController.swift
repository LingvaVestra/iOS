//
//  AuthViewController.swift
//  LingvaVestra
//
//  Created by Sergey Pavlov on 08.12.2023.
//

import UIKit
import SnapKit

private enum Constants {
    static let topPadding: CGFloat = 60.0
    static let leadingOffset: CGFloat = 40.0
    static let verticalStackSpacing: CGFloat = 20.0
    static let loginButtonCornerRadius: CGFloat = 10.0
}

final class AuthViewController: BaseViewController {

    // MARK: - Properties

    private lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.autocapitalizationType = .none
        textField.borderStyle = .roundedRect
        return textField
    }()

    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.isSecureTextEntry = true
        textField.textContentType = .password
        textField.autocorrectionType = .no
        textField.borderStyle = .roundedRect
        return textField
    }()

    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.layer.cornerRadius = Constants.loginButtonCornerRadius
        button.backgroundColor = .gray

        button.addTarget(self, action: #selector(loginDidTap), for: .touchUpInside)

        return button
    }()

    private let verticalStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = Constants.verticalStackSpacing
        stackView.axis = .vertical
        return stackView
    }()

    // MARK: - Actions

    @objc
    private func loginDidTap() {
        
        // add later validating textfields
        guard let loginText = loginTextField.text, let passwordText = passwordTextField.text else { return }

        // move logic to AuthPresenter?
        AuthService().login(username: loginText, password: passwordText) { result in
            switch result {
            case .success(let loginData):
                let tokens = LoginModel(accessToken: loginData.accessToken, refreshToken: loginData.refreshToken)
                KeychainManager.shared.setTokens(tokens)
                NavigationManager.shared.navigate(.tabBar)
            case .error(let error):
                // add alert ?
                print(error)
            }
        }
    }
}

// MARK: - Setup Subviews

extension AuthViewController {

    override func setupSubviews() {
        super.setupSubviews()

        title = "Login screen"
    }

    override func embedSubviews() {
        super.embedSubviews()

        [
            loginTextField,
            passwordTextField,
            loginButton
        ].forEach(verticalStack.addArrangedSubview)

        view.addSubview(verticalStack)
    }

    override func setupConstraints() {
        super.setupConstraints()

        verticalStack.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(Constants.topPadding)
            $0.leading.equalTo(Constants.leadingOffset)
            $0.trailing.equalTo(-Constants.leadingOffset)
        }
    }
}
