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
    
    private lazy var photoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "person"))
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .systemBackground
        imageView.tintColor = .secondarySystemBackground
        imageView.clipsToBounds = true
        
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
        addSubview(photoImageView)
    }
    
    override func setConstraints() {
        self.snp.makeConstraints {
            $0.height.equalTo(Constants.superviewHeight)
        }
        
        photoImageView.snp.makeConstraints {
            $0.size.equalTo(Constants.imageViewSize)
            $0.centerX.equalToSuperview()
        }
    }
    
    override func updateSubviews() {
        photoImageView.layer.cornerRadius = photoImageView.bounds.height / 2.0
        photoImageView.layer.masksToBounds = true
    }
}
