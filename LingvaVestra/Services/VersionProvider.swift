//
//  VersionProvider.swift
//  LingvaVestra
//

import Foundation

enum VersionProvider {

  static var version: String = {

    guard let version = Bundle.main.infoDictionary?[Constants.versionKey] as? String else {
      assertionFailure("Unable to fetch version from Info.plist")
      return String()
    }

    let versionText = "v. \(version)"

    return versionText
  }()

  private enum Constants {
    static let versionKey = "CFBundleShortVersionString"
  }
}
