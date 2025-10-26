//
//  UserDefaultsStorage.swift
//  Data
//
//  Created by 지연 on 10/26/25.
//

import Foundation

import Domain

public final class UserDefaultsStorage: KeyValueStorage {
    public static let shared = UserDefaultsStorage()
    private let defaults: UserDefaults
    
    private init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }
    
    public func set<T>(_ value: T, for key: UserDefaultsKey) {
        defaults.set(value, forKey: key.rawValue)
    }
    
    public func get<T>(_ type: T.Type, for key: UserDefaultsKey) -> T? {
        return defaults.object(forKey: key.rawValue) as? T
    }
    
    public func remove(for key: UserDefaultsKey) {
        defaults.removeObject(forKey: key.rawValue)
    }
}
