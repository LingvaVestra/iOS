//
//  Endpoint.swift
//  LingvaVestra
//

import Foundation
import Alamofire

// MARK: - Endpoint

protocol EndpointProtocol {

    var url: String { get }
    var method: HTTPMethod { get }
    var body: Data? { get }
    var params: [String: Any]? { get }
    var headers: HTTPHeaders? { get }
    var encoding: ParameterEncoding? { get }
    var baseURL: String { get }
}

extension EndpointProtocol {
    var body: Data? { nil }
    var params: [String: Any]? { nil }
    var headers: HTTPHeaders? { nil }
    var encoding: ParameterEncoding? { nil }
    var baseURL: String { "http://127.0.0.1:8180/api/v1" }

}

enum Endpoint: EndpointProtocol {

    // MARK: - Login

    case login(username: String, password: String)
    case logout

    // MARK: - Profile

    case profile

    // MARK: - URL

    var url: String {
        switch self {

        // MARK: - Login

        case .login:
            return "auth/login"
        case .logout:
            // can't find on backend
            return "logout"

        // MARK: - Profile

        case .profile:
            return "users/me"
        }
    }

    // MARK: - HTTPMethod

    var method: HTTPMethod {
        switch self {
        case .login,
                .logout:
            return .post
        case .profile:
            return .get
        }
    }

    // MARK: - Parameters

    var params: [String: Any]? {
        switch self {
        case .login(let username, let password):
            return LoginRequest(username: username, password: password).toJSON()
        default:
            return nil
        }
    }
}
