//
//  ProfileModel.swift
//  LingvaVestra
//

import Foundation

// MARK: - ProfileModel

struct ProfileModel: Decodable {
    let id: Int
    let email: String
    let phone: String
    let name: String
}
