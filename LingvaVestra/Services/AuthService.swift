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
    
    // MARK: - Dependencies

    private let netwokManager: NetworkManagerProtocol

    // MARK: - init

    init(netwokManager: NetworkManagerProtocol) {
        self.netwokManager = netwokManager
    }
}

// MARK: - AuthServiceProtocol

extension AuthService: AuthServiceProtocol {
    /// Logs in a user using the provided credentials.
    func login(username: String, password: String, completion: @escaping (AFResult<LoginModel>) -> Void) {
        
        let parameters = LoginEncodable(username: username, password: password).toJSON()
        let request: RequestProtocol = LoginRequest(params: parameters)

        netwokManager.makeRequest(request: request, error: .login, completion: completion)
    }
}
