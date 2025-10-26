//
//  KeychainStorage.swift
//  Data
//
//  Created by 지연 on 10/26/25.
//

import Foundation

import Domain

public final class KeychainStorage: SecureStorage {
    public static let shared = KeychainStorage()
    
    private init() {}
    
    public func set(_ value: String, for key: KeychainKey) -> Bool {
        guard let data = value.data(using: .utf8) else { return false }
        
        // 기존 값 삭제
        _ = remove(for: key)
        
        // 새 값 추가
        let status = SecItemAdd([
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key.rawValue,
            kSecValueData: data
        ] as CFDictionary, nil)
        
        return status == errSecSuccess
    }
    
    public func get(for key: KeychainKey) -> String? {
        var item: CFTypeRef?
        let status = SecItemCopyMatching([
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key.rawValue,
            kSecReturnData: true,
            kSecMatchLimit: kSecMatchLimitOne
        ] as CFDictionary, &item)
        
        guard status == errSecSuccess,
              let data = item as? Data,
              let value = String(data: data, encoding: .utf8) else {
            return nil
        }
        
        return value
    }
    
    public func remove(for key: KeychainKey) -> Bool {
        let status = SecItemDelete([
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key.rawValue
        ] as CFDictionary)
        
        return status == errSecSuccess
    }
}
