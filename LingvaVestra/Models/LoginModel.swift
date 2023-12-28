//
//  LoginModel.swift
//  LingvaVestra
//

import Foundation
import Alamofire

// MARK: - LoginRequest

struct LoginRequest: RequestProtocol {
    let url = "auth/login"
    let method: Alamofire.HTTPMethod = .post
    let username: String
    let password: String
    var params: [String: Any]? {
        ["password": password, "username": username]
    }
}

// MARK: - LoginResponse

struct LoginModel: Decodable {
    let accessToken: String
    let refreshToken: String

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
    }
}
