//
//  BaseTextView.swift
//  LingvaVestra
//

import UIKit
import SnapKit

private enum Constants {
    static let fontSize: CGFloat = 16.0
    static let padding: CGFloat = 10.0
    static let cornerRadius: CGFloat = 10.0
}

class BaseTextView: UITextView {

    // MARK: - Properties

    private let textPadding = UIEdgeInsets(
        top: Constants.padding,
        left: Constants.padding,
        bottom: Constants.padding,
        right: Constants.padding
    )

    private lazy var placeholderLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Constants.fontSize)
        label.textColor = .lightGray
        label.textAlignment = .left
        label.text = placeholder
        label.numberOfLines = 0

        return label
    }()

    private var placeholder: String?

    // MARK: - init

    init(placeholder: String? = nil) {
        self.placeholder = placeholder
        super.init(frame: .zero, textContainer: nil)

        setupSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Subviews

private extension BaseTextView {
    func setupSubviews() {

        embedSubviews()
        setupConstraints()
        updateSubviews()

        delegate = self
        textContainerInset = textPadding
        layer.cornerRadius = Constants.cornerRadius
        font = .systemFont(ofSize: Constants.fontSize)
    }

    func embedSubviews() {
        addSubviews(placeholderLabel)
    }

    func updateSubviews() {
        placeholderLabel.isHidden = hasText
    }

    func setupConstraints() {
        placeholderLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(textPadding.left)
            $0.top.equalToSuperview().inset(textPadding.top)
        }
    }
}

// MARK: - UITextViewDelegate

extension BaseTextView: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        placeholderLabel.isHidden = true
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        updateSubviews()
    }
}
