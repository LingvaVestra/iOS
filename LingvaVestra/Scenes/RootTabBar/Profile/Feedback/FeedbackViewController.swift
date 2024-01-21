//
//  FeedbackViewController.swift
//  LingvaVestra
//

import UIKit
import SnapKit

private enum Constants {
    static let topPadding: CGFloat = 20.0
    static let sendButtonWidth: CGFloat = 200.0
    static let sendButtonHeight: CGFloat = 44.0
    static let cornerRadius: CGFloat = 10.0
    static let stackViewSpacing: CGFloat = 15.0
    static let emailLabelSpacing: CGFloat = 3.0
    static let descriptionFontSize: CGFloat = 12.0
    static let horisontalInset: CGFloat = 20.0
    static let textViewHeight: CGFloat = 150.0
    static let labelFontSize: CGFloat = 12.0
}

protocol FeedbackViewProtocol: BaseViewProtocol {
    /// Notifies that new data has been received.
    func didReceiveData()
    /// Navigates to rootController of NavigationStack.
    func popToRoot(animated: Bool)
}

final class FeedbackViewController: BaseViewController, UITextViewDelegate {

    // MARK: - Properties

    var presenter: FeedbackPresenterProtocol!

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = .zero
        label.font = .systemFont(ofSize: Constants.descriptionFontSize)
        label.text = Strings.Profile.Feedback.description
        
        return label
    }()

    private lazy var emailTextField: BaseTextField = {
        let textField = BaseTextField()
        textField.delegate = self
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

    private let commentaryTextView: BaseTextView = {
        let placeholder = Strings.Profile.Feedback.textViewPlaceholder
        let textView = BaseTextView(placeholder: placeholder)
        textView.iq.placeholder = placeholder

        return textView
    }()

    private let verticalStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Constants.stackViewSpacing

        return stackView
    }()

    private lazy var sendButton: UIButton = {
        let button = UIButton()
        button.setTitle(Strings.Profile.Feedback.sendButtonTitle, for: .normal)
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .greenButton
        button.addTarget(self, action: #selector(sendDidTap), for: .touchUpInside)

        return button
    }()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewDidLoad()
    }

    // MARK: - Actions

    @objc
    private func sendDidTap() {
        presenter.sendDidTap()
    }
}

// MARK: - Setup Subviews

extension FeedbackViewController {

    override func setupSubviews() {
        super.setupSubviews()

        title = Strings.Profile.Feedback.title

        view.backgroundColor = .secondarySystemBackground
        verticalStack.setCustomSpacing(Constants.emailLabelSpacing, after: emailTextField)
    }

    override func embedSubviews() {

        verticalStack.addArrangedSubviews(
            descriptionLabel,
            emailTextField,
            emailLabel,
            commentaryTextView
        )

        view.addSubviews(
            verticalStack,
            sendButton)
    }

    override func setupConstraints() {

        commentaryTextView.snp.makeConstraints {
            $0.height.equalTo(Constants.textViewHeight)
        }

        verticalStack.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(Constants.topPadding)
            $0.leading.trailing.equalToSuperview().inset(Constants.horisontalInset)
        }

        sendButton.snp.makeConstraints {
            $0.top.equalTo(verticalStack.snp.bottom).offset(Constants.topPadding)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(CGSize(
                width: Constants.sendButtonWidth,
                height: Constants.sendButtonHeight)
            )
        }
    }
}

// MARK: - View Protocol

extension FeedbackViewController: FeedbackViewProtocol {
    /// Notifies that new data has been received.
    func didReceiveData() {
        // update Interface with data
    }
}

// MARK: - UITextFieldDelegate

extension FeedbackViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
    }
}
