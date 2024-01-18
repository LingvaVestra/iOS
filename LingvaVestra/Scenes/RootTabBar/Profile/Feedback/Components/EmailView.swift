//
//  EmailPanel.swift
//  LingvaVestra
//

import UIKit
import SnapKit

private enum Constants {
    static let verticalStackSpacing: CGFloat = 3
    static let labelFontSize: CGFloat = 12
}

final class EmailView: BaseView {

    // MARK: - Properties

    private var textFieldDelegate: UITextFieldDelegate?

    private lazy var emailTextField: BaseTextField = {
        let textField = BaseTextField()
        textField.delegate = textFieldDelegate
        textField.placeholder = Strings.Profile.Feedback.emailTextFieldPlaceholder
        return textField
    }()

    private let emailLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = .zero
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: Constants.labelFontSize)
        label.text = Strings.Profile.Feedback.emailDescription
        return label
    }()

    private let verticalStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Constants.verticalStackSpacing

        return stackView
    }()

    init(textFieldDelegate: UITextFieldDelegate? = nil) {
        self.textFieldDelegate = textFieldDelegate
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Methods

extension EmailView {
    /// Configures EmailView with ProfileModel
    func configure(profileModel: ProfileModel) {
        emailTextField.text = profileModel.email
    }
}

// MARK: - Setup subviews

extension EmailView {

    override func embedSubviews() {
        verticalStack.addArrangedSubviews(
            emailTextField,
            emailLabel
        )

        addSubviews(verticalStack)
    }

    override func setupConstraints() {
        verticalStack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
