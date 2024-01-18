//
//  BaseTextView.swift
//  LingvaVestra
//

import UIKit

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

extension BaseTextView {
    private func setupSubviews() {
        text = placeholder
        delegate = self
        textContainerInset = textPadding
        layer.cornerRadius = Constants.cornerRadius
        font = .systemFont(ofSize: Constants.fontSize)
        textColor = .lightGray
    }
}

// MARK: - UITextViewDelegate

extension BaseTextView: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textColor == .lightGray {
            text = ""
            textColor = .black
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = placeholder
            textView.textColor = .lightGray
        }
    }
}
