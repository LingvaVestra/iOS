//
//  ProfileViewController.swift
//  LingvaVestra
//

import UIKit
import SnapKit

private enum Constants {
    static let padding: CGFloat = 20.0
    static let tableViewRowHeight = 70.0
    static let versionPadding: CGFloat = 40.0
}

protocol ProfileViewProtocol: BaseViewProtocol {
    /// Notifies that new data has been received.
    func didReceiveData()
}

final class ProfileViewController: BaseViewController {
    
    // MARK: - Properties
    
    var presenter: ProfilePresenterProtocol!
    
    private var profileHeaderView = ProfileHeaderView()

    private lazy var settingsTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.isScrollEnabled = false
        tableView.separatorColor = .clear
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.reuseIdentifier)

        return tableView
    }()

    private let versionLabel: UILabel = {
        let label = UILabel()
        label.text = VersionProvider.version
        label.textColor = .lightGray
        label.textAlignment = .center
        
        return label
    }()

    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
}

// MARK: - Setup Subviews

extension ProfileViewController {
    
    override func setupSubviews() {
        super.setupSubviews()
        
        view.backgroundColor = .systemBackground
    }
    
    override func embedSubviews() {
        
        view.addSubviews(
            profileHeaderView,
            settingsTableView,
            versionLabel
        )
    }

    override func setupConstraints() {

        profileHeaderView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(Constants.padding)
            $0.leading.trailing.equalToSuperview().inset(Constants.padding)
        }

        settingsTableView.snp.makeConstraints {
            $0.top.equalTo(profileHeaderView.snp.bottom).offset(Constants.padding)
            $0.leading.trailing.equalToSuperview().inset(Constants.padding)
            $0.bottom.equalTo(versionLabel.snp.top).inset(Constants.padding)
        }

        versionLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(Constants.versionPadding)
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

// MARK: - UITableViewDelegate

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constants.tableViewRowHeight
    }
}

// MARK: - UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SettingsTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        let currentItem = presenter.items[indexPath.row]
        cell.configure(item: currentItem)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentItem = presenter.items[indexPath.row]
        presenter.didSelectSettingsRow(item: currentItem)
    }
}
