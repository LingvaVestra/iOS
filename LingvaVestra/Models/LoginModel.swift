//
//  LoginModel.swift
//  LingvaVestra
//

import Foundation

// MARK: - LoginRequest

struct LoginRequest: Encodable {

    let username: String
    let password: String

        enum CodingKeys: String, CodingKey {
            case username
            case password
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
