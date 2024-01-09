//
//  ProfileHeaderView.swift
//  LingvaVestra
//

import UIKit
import SnapKit

private enum Constants {
    static let verticalStackSpacing: CGFloat = 10.0
    static let nameLabelFontSize: CGFloat = 16.0
}

final class ProfileHeaderView: BaseView {

    // MARK: - Properties

    private let userPhotoView = UserPhotoView()

    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "John"
        label.font = UIFont.boldSystemFont(ofSize: Constants.nameLabelFontSize)

        return label
    }()

    private let userEmailLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "sample@sample.com"
        label.textColor = .gray

        return label
    }()

    private let verticalStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Constants.verticalStackSpacing

        return stackView
    }()

}

// MARK: - Methods

extension ProfileHeaderView {
    /// Configures headerView with ProfileModel
    func configure(profileModel: ProfileModel) {
        userPhotoView.configure(url: profileModel.urlPhoto)
        userNameLabel.text = profileModel.name
        userEmailLabel.text = profileModel.email
    }
}

// MARK: - Setup subviews

extension ProfileHeaderView {

    override func embedSubviews() {
        verticalStack.addArrangedSubviews(
            userPhotoView,
            userNameLabel,
            userEmailLabel
        )

        addSubviews(verticalStack)
    }

    override func setupConstraints() {
        verticalStack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
