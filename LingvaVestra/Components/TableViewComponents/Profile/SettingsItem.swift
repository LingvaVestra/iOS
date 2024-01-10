//
//  SettingsItem.swift
//  LingvaVestra
//

import Foundation
import UIKit

enum SettingsItem {
    case rateApp
    case logout
    case deleteProfile

    var title: String {
        switch self {
        case .rateApp:
            return .Settings.rateApp
        case .logout:
            return .Settings.logout
        case .deleteProfile:
            return .Settings.deleteProfile
        }
    }

    var titleColor: UIColor {
        switch self {
        case .rateApp:
            return .label
        case .logout:
            return .red
        case .deleteProfile:
            return .red
        }
    }
}

extension String {
    enum Settings {
        static let rateApp = "Rate app"
        static let logout = "Exit"
        static let deleteProfile = "Delete profile"
    }
}
