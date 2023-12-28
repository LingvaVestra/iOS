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
        textField.delegate = self

        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.isSecureTextEntry = true
        textField.textContentType = .password
        textField.autocorrectionType = .no
        textField.borderStyle = .roundedRect
        textField.delegate = self

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
        stackView.spacing = Constants.verticalStackSpacing
        stackView.axis = .vertical
        
        return stackView
    }()
    
    // MARK: - Actions
    
    @objc
    private func loginDidTap() {
        
        // TODO: Add validating textfields
        
        guard let loginText = loginTextField.text, let passwordText = passwordTextField.text else { return }
        
        // TODO: Move logic to AuthPresenter, change AuthService type to AuthServiceProtocol
        
        AuthService().login(username: loginText, password: passwordText) { [weak self] result in
            switch result {
            case .success(let loginData):
                let tokens = LoginModel(accessToken: loginData.accessToken, refreshToken: loginData.refreshToken)
                KeychainManager.shared.setTokens(tokens)
                NavigationManager.shared.navigate(.tabBar)
            case .error:
                self?.showAlert()
            }
        }
    }
    
    private func showAlert() {
        let alertController = UIAlertController(title: "Error", message: nil, preferredStyle: .alert)
        let closeAction = UIAlertAction(title: "Close", style: .default, handler: nil)
        alertController.addAction(closeAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

// MARK: - Setup Subviews

extension AuthViewController {
    
    override func setupSubviews() {
        super.setupSubviews()
        
        title = "Login screen"
    }
    
    override func embedSubviews() {
        
        verticalStack.addArrangedSubviews(
            loginTextField,
            passwordTextField,
            loginButton
        )
        
        view.addSubview(verticalStack)
    }
    
    override func setupConstraints() {
        
        verticalStack.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(Constants.topPadding)
            $0.leading.equalTo(Constants.leadingOffset)
            $0.trailing.equalTo(-Constants.leadingOffset)
        }
    }
}

// MARK: - UITextFieldDelegate

extension AuthViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
    }
}
