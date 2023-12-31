//
//  ProfileViewController.swift
//  LingvaVestra
//

import UIKit
import SnapKit

private enum Constants {
    static let padding: CGFloat = 20.0
    static let logoutButtonWidth: CGFloat = 100.0
    static let logoutButtonHeight: CGFloat = 44.0
    static let logoutCornerRadius: CGFloat = 10.0
}

protocol ProfileViewProtocol: BaseViewProtocol {
    /// Notifies that new data has been received.
    func didReceiveData()
}

final class ProfileViewController: BaseViewController {
    
    // MARK: - Properties
    
    var presenter: ProfilePresenterProtocol!
    
    private lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Logout", for: .normal)
        button.layer.cornerRadius = Constants.logoutCornerRadius
        button.backgroundColor = .gray
        button.addTarget(self, action: #selector(logoutDidTap), for: .touchUpInside)
        
        return button
    }()
    
    private var profileHeaderView: ProfileHeaderView = {
        let profileHeader = ProfileHeaderView()
        
        return profileHeader
    }()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @objc
    private func logoutDidTap() {
        presenter.logoutDidTap()
    }
}

// MARK: - Setup Subviews

extension ProfileViewController {
    
    override func setupSubviews() {
        super.setupSubviews()
        
        view.backgroundColor = .systemGray4
    }
    
    override func embedSubviews() {
        
        view.addSubviews(
            logoutButton,
            profileHeaderView
        )
    }
    
    override func setupConstraints() {
        
        logoutButton.snp.makeConstraints {
            $0.top.equalTo(profileHeaderView.snp.bottom).offset(Constants.padding)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(CGSize(
                width: Constants.logoutButtonWidth,
                height: Constants.logoutButtonHeight)
            )
        }
        profileHeaderView.snp.makeConstraints { 
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(Constants.padding)
            $0.leading.trailing.equalToSuperview().inset(Constants.padding)
        }
    }
}

// MARK: - View Protocol

extension ProfileViewController: ProfileViewProtocol {
    /// Notifies that new data has been received.
    func didReceiveData() {
        // update Interface with data
    }
}
