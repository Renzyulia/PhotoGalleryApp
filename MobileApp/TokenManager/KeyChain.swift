//
//  KeyChain.swift
//  MobileApp
//
//  Created by Yulia Ignateva on 22.04.2022.
//

import UIKit
import Security

final class KeyChain {
    func save(token: String, key: String, service: String) {
        let token = token.data(using: String.Encoding.utf8)!
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: key,
            kSecValueData: token
        ] as! CFDictionary
                     
        let status = SecItemAdd(query, nil)
        guard status == errSecSuccess else { return }
    }
    
    func get(key: String, service: String) -> String? {
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: key,
            kSecMatchLimit: kSecMatchLimitOne,
            kSecReturnData: true
        ] as! CFDictionary
        var result: AnyObject?
        let _ = SecItemCopyMatching(query, &result)
        
        guard let data = result as? Foundation.Data else { return nil }
        return String(data: data, encoding: String.Encoding.utf8)
    }
    
    func delete(token: String, key: String, service: String) {
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: key,
        ] as! CFDictionary
        
        let status = SecItemDelete(query)
        guard status == errSecSuccess else { return }
    }
}
