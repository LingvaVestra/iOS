//
//  LoginModel.swift
//  LingvaVestra
//

import Foundation
import Alamofire

// MARK: - LoginEncodable

struct LoginEncodable: Encodable {
    let username: String
    let password: String
}

// MARK: - LoginRequest

struct LoginRequest: RequestProtocol {
    let url = "auth/login"
    let method: Alamofire.HTTPMethod = .post
    let username: String
    let password: String
    var params: [String: Any]? {
        LoginEncodable(username: username, password: password).toJSON()
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
