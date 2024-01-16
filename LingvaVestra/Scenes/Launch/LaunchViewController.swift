//
//  LaunchViewController.swift
//  LingvaVestra
//

import UIKit
import Lottie
import SnapKit

private enum Constants {
    static let animationSpeed: CGFloat = 1.0
    static let animationTime: TimeInterval = 3.0
    static let animationName = "LaunchAnimation"
}

final class LaunchViewController: BaseViewController {

    // MARK: - Properties

    /// Receive a notification when the launchView has finish animation
    var loadedLaunchHandler: ((Bool) -> Void)?

    private var animationView: LottieAnimationView = {
        let animationView: LottieAnimationView = .init(name: Constants.animationName)
        animationView.backgroundColor = .launchBackground
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = Constants.animationSpeed
        return animationView
    }()

    // MARK: - Life cycle

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        animateViews()
    }

    // MARK: - Private methods

    @objc
    private func finishModule() {
        self.loadedLaunchHandler?(true)
    }
}

// MARK: - Setup Subviews

extension LaunchViewController {

    override func setupSubviews() {
        super.setupSubviews()

        view.backgroundColor = .launchBackground
    }

    override func embedSubviews() {
        view.addSubview(animationView)
    }

    override func setupConstraints() {
        animationView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

// MARK: - Animation

extension LaunchViewController {
    private func animateViews() {
        animationView.play()

        Timer.scheduledTimer(
            timeInterval: Constants.animationTime,
            target: self,
            selector: #selector(finishModule),
            userInfo: nil, 
            repeats: false
        )
    }
}
