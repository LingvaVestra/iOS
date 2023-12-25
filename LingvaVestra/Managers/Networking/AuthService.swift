//
//  AuthService.swift
//  LingvaVestra
//

import Foundation
import Alamofire

final class AuthService {
    
    // MARK: - login
    
    func login(username: String, password: String, completion: @escaping (AFResult<LoginModel>) -> Void) {
        let endpoint: EndpointProtocol = Endpoint.login(username: username, password: password)

        guard let url = URL(string: endpoint.baseURL)?.appendingPathComponent(endpoint.url) else {
            completion(.error(NetworkError(.invalidURL)))
            return
        }

        AF.request(url, method: endpoint.method, parameters: endpoint.params)
            .validate()
        
            .responseDecodable(of: LoginModel.self) { response in
                switch response.result {
                case .success(let answer):
                    // print to see result - change later
                    print(answer)
                    completion(.success(answer))
                case .failure(let afError):
                    // print to see result - change later
                    print(afError)
                    completion(.error(NetworkError(.login)))
                }
            }
    }
}
