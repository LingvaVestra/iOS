//
//  UserPhotoView.swift
//  LingvaVestra
//

import UIKit
import SnapKit
import Kingfisher

private enum Constants {
    static let superviewHeight: CGFloat = 100.0
    static let imageViewSize: CGFloat = 100.0
}

final class UserPhotoView: BaseView {
    
    // MARK: - Properties
    
    private var photoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "person"))
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .systemBackground
        imageView.tintColor = .secondarySystemBackground
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = Constants.imageViewSize / 2.0
        imageView.layer.masksToBounds = true

        return imageView
    }()
}

// MARK: - Methods

extension UserPhotoView {
    /// Configures photoView with url
    func configure(url: String) {
        guard let url = URL(string: url) else { return }
        
        photoImageView.kf.setImage(with: url)
    }
}

// MARK: - Setup subviews

extension UserPhotoView {

    override func embedSubviews() {
        addSubviews(photoImageView)
    }

    override func setupConstraints() {
        self.snp.makeConstraints {
            $0.height.equalTo(Constants.superviewHeight)
        }

        photoImageView.snp.makeConstraints {
            $0.size.equalTo(Constants.imageViewSize)
            $0.centerX.equalToSuperview()
        }
    }
}
