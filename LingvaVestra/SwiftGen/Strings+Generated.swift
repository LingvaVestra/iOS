// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Strings {
  internal enum Login {
    /// Localizable.strings
    ///   LingvaVestra
    /// 
    ///   Created by Егор on 08.01.2024.
    internal static let loginButtonTitle = Strings.tr("Localizable", "Login.loginButtonTitle", fallback: "Login")
  }
  internal enum Profile {
    /// v. 1.1
    internal static let version = Strings.tr("Localizable", "Profile.version", fallback: "v. 1.1")
    internal enum Feedback {
      /// Нам важно знать ваше мнение, чтобы сделать приложения лучше. Напишите нам свои пожелания или сообщите о возникших проблемах.
      internal static let description = Strings.tr("Localizable", "Profile.Feedback.description", fallback: "Нам важно знать ваше мнение, чтобы сделать приложения лучше. Напишите нам свои пожелания или сообщите о возникших проблемах.")
      /// Мы ответим вам
      internal static let emailDescription = Strings.tr("Localizable", "Profile.Feedback.emailDescription", fallback: "Мы ответим вам")
      /// Почта
      internal static let emailTextFieldPlaceholder = Strings.tr("Localizable", "Profile.Feedback.emailTextFieldPlaceholder", fallback: "Почта")
      /// Отправить
      internal static let sendButtonTitle = Strings.tr("Localizable", "Profile.Feedback.sendButtonTitle", fallback: "Отправить")
      /// Комментарий
      internal static let textViewPlaceholder = Strings.tr("Localizable", "Profile.Feedback.textViewPlaceholder", fallback: "Комментарий")
      /// Обратная связь
      internal static let title = Strings.tr("Localizable", "Profile.Feedback.title", fallback: "Обратная связь")
    }
    internal enum Settings {
      /// Delete Profile
      internal static let deleteProfile = Strings.tr("Localizable", "Profile.Settings.deleteProfile", fallback: "Delete Profile")
      /// Feedback
      internal static let feedback = Strings.tr("Localizable", "Profile.Settings.feedback", fallback: "Feedback")
      /// Exit
      internal static let logout = Strings.tr("Localizable", "Profile.Settings.logout", fallback: "Exit")
      /// Rate App
      internal static let rateApp = Strings.tr("Localizable", "Profile.Settings.rateApp", fallback: "Rate App")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Strings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
