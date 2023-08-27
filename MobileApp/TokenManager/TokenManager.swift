//
//  TokenStorage.swift
//  MobileApp
//
//  Created by Yulia Ignateva on 22.04.2022.
//

import Foundation

final class TokenManager {
    static let shared = TokenManager()
    
    private init() {}
    
    private let keyForKeyChain = "User"
    private let serviceForKeyChain = "MobileApp.com"
    private let keyChain = KeyChain()
    
    func save(token: String) {
        keyChain.save(token: token, key: keyForKeyChain, service: serviceForKeyChain)
    }
    
    func getToken() -> String? {
        return keyChain.get(key: keyForKeyChain, service: serviceForKeyChain)
    }
    
    func delete(token: String) {
        keyChain.delete(token: token, key: keyForKeyChain, service: serviceForKeyChain)
    }
}
