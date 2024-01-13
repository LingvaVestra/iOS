//
//  SettingsItem.swift
//  LingvaVestra
//

import UIKit

enum SettingsItem {
    case rateApp
    case logout
    case deleteProfile

    var title: String {
        switch self {
        case .rateApp:
            return Strings.Profile.Settings.rateApp
        case .logout:
            return Strings.Profile.Settings.logout
        case .deleteProfile:
            return Strings.Profile.Settings.deleteProfile
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
