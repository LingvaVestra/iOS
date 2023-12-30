//
//  AFResult.swift
//  LingvaVestra
//

import Foundation
import Alamofire

enum AFResult<T: Decodable> {
    case success(T)
    case error(NetworkError)
}
