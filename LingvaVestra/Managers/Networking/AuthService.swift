//
//  AuthService.swift
//  LingvaVestra
//

import Foundation
import Alamofire

protocol AuthServiceProtocol {
    /// Logs in a user using the provided credentials.
    func login(username: String, password: String, completion: @escaping (AFResult<LoginModel>) -> Void)
}

final class AuthService {
    
    // MARK: - Dependensies
    
    private let netwokManager: NetworkManagerProtocol = NetworkManager.shared
}

// MARK: - AuthServiceProtocol

extension AuthService: AuthServiceProtocol {
    func login(username: String, password: String, completion: @escaping (AFResult<LoginModel>) -> Void) {
        
        let request: RequestProtocol = LoginRequest(username: username, password: password)
        
        netwokManager.makeRequest(request: request, error: .login, completion: completion)
    }
}
