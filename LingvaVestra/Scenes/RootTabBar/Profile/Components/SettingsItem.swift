//
//  SettingsItem.swift
//  LingvaVestra
//

import UIKit

enum SettingsItem: CaseIterable {
    case rateApp
    case feedback
    case logout
    case deleteProfile

    var title: String {
        switch self {
        case .rateApp:
            return Strings.Profile.Settings.rateApp
        case .feedback:
            return Strings.Profile.Settings.feedback
        case .logout:
            return Strings.Profile.Settings.logout
        case .deleteProfile:
            return Strings.Profile.Settings.deleteProfile
        }
    }

    var titleColor: UIColor {
        switch self {
        case .logout:
            return .red
        case .deleteProfile:
            return .red
        default:
            return .label
        }
    }
}
