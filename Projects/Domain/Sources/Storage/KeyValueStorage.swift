//
//  KeyValueStorage.swift
//  Domain
//
//  Created by 지연 on 10/26/25.
//

import Foundation

public protocol KeyValueStorage {
    func set<T>(_ value: T, for key: UserDefaultsKey)
    func get<T>(_ type: T.Type, for key: UserDefaultsKey) -> T?
    func remove(for key: UserDefaultsKey)
}
