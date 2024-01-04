//
//  ProfileHeaderView.swift
//  LingvaVestra
//

import Foundation
import UIKit
import SnapKit

private enum Constants {
    static let verticalStackSpacing: CGFloat = 10.0
    static let nameLabelFontSize: CGFloat = 16
}

final class ProfileHeaderView: BaseView {

    // MARK: - Properties

    let userPhotoView: UserPhotoView = {
        let photoView = UserPhotoView()

        return photoView
    }()

    let userNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "John"
        label.font = UIFont.boldSystemFont(ofSize: Constants.nameLabelFontSize)

        return label
    }()

    let userEmailLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "sample@sample.com"
        label.textColor = .gray

        return label
    }()

    let verticalStack: UIStackView = {
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

    override func setConstraints() {
        verticalStack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
