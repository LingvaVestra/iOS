//
//  SettingsTableViewCell.swift
//  LingvaVestra
//

import UIKit
import SnapKit

private enum Constants {
    static let backgroundBorderWidth: CGFloat = 1.0
    static let backgroundCornerRadius: CGFloat = 10.0
    static let disclosureImageSize: CGFloat = 20.0
    static let padding: CGFloat = 20.0
    static let backgroundInset: CGFloat = 10.0
}

class SettingsTableViewCell: BaseTableViewCell {

    // MARK: - Properties

    private let disclosureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .badge
        return imageView
    }()

    private let settingsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()

    private lazy var backgroundViewCell: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.borderWidth = Constants.backgroundBorderWidth
        view.layer.cornerRadius = Constants.backgroundCornerRadius
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()
}

// MARK: - Internal methods
extension SettingsTableViewCell {

    func configure(item: SettingsItem) {
        settingsLabel.text = item.title
        settingsLabel.textColor = item.titleColor
    }
}

// MARK: - Setup Subviews

extension SettingsTableViewCell {
    override func setupSubviews() {
        super.setupSubviews()

        backgroundColor = .clear
    }

    override func embedSubviews() {
        backgroundViewCell.addSubviews(settingsLabel, disclosureImageView)
        addSubviews(backgroundViewCell)
    }

    override func setupConstraints() {
        settingsLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(Constants.padding)
        }

        disclosureImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(Constants.padding)
            $0.size.equalTo(Constants.disclosureImageSize)
        }

        backgroundViewCell.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(Constants.backgroundInset)
        }
    }
}
