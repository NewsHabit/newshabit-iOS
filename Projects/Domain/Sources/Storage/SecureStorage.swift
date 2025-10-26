//
//  SecureStorage.swift
//  Domain
//
//  Created by 지연 on 10/26/25.
//

import Foundation

public protocol SecureStorage {
    @discardableResult func set(_ value: String, for key: KeychainKey) -> Bool
    func get(for key: KeychainKey) -> String?
    @discardableResult func remove(for key: KeychainKey) -> Bool
}
