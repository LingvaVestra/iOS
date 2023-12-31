//
//  KeychainManager.swift
//  LingvaVestra
//

import Foundation

/// Enum defining keys for accessing token information in the keychain.
enum KeychainKey: String {
    case accessToken = "access_token"
    case refreshToken = "refresh_token"
}

/// Manages storing and retrieving tokens in the keychain for user authentication.
final class KeychainManager {

    // MARK: - Properties

    static let shared = KeychainManager()

    /// Access token stored in the keychain. Allows getting and setting the access token securely.
    var accessToken: String? {
        get {
            getKeychainValue(forKey: KeychainKey.accessToken.rawValue)
        }
        set {
            guard let newValue = newValue else {
                removeKeychainValue(forKey: KeychainKey.accessToken.rawValue)
                return
            }
            setKeychainValue(value: newValue, forKey: KeychainKey.accessToken.rawValue)
        }
    }

    /// Refresh token stored in the keychain. Allows getting and setting the refresh token securely.
    var refreshToken: String? {
        get {
            getKeychainValue(forKey: KeychainKey.refreshToken.rawValue)
        }
        set {
            guard let newValue = newValue else {
                removeKeychainValue(forKey: KeychainKey.refreshToken.rawValue)
                return
            }
            setKeychainValue(value: newValue, forKey: KeychainKey.refreshToken.rawValue)
        }
    }

    /// Indicates whether the user is authorized based on the presence of a refresh token.
    var isAuthorized: Bool {
        refreshToken != nil
    }

    // MARK: - init
    
    private init() {}

    // MARK: - Methods

    /// Sets both access and refresh tokens in the keychain.
        /// - Parameter tokens: An instance of LoginModel containing access and refresh tokens.
    func setTokens(_ loginModel: LoginModel) {
        accessToken = loginModel.accessToken
        refreshToken = loginModel.refreshToken
    }

    /// Removes both access and refresh tokens from the keychain.
    func removeAllData() {
        [
            KeychainKey.accessToken.rawValue,
            KeychainKey.refreshToken.rawValue
        ].forEach(removeKeychainValue)
    }
}

// MARK: - Private methods

private extension KeychainManager {

    func setKeychainValue(value: String, forKey key: String) {
        guard let data = value.data(using: .utf8) else { return }

        removeKeychainValue(forKey: key)

        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecValueData as String: data
        ]

        SecItemAdd(query as CFDictionary, nil)
    }

    func getKeychainValue(forKey key: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]

        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)

        if status == errSecSuccess, let data = dataTypeRef as? Data {
            return String(data: data, encoding: .utf8)
        } else {
            return nil
        }
    }

    func removeKeychainValue(forKey key: String) {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key
        ]

        SecItemDelete(query as CFDictionary)
    }
}
