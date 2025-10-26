//
//  DataDIContainer.swift
//  Data
//
//  Created by 지연 on 10/26/25.
//

import UIKit

import DIKit
import Domain

public final class DataDIContainer {
    public static let shared = DataDIContainer()
    
    private let container = DIContainer.shared
    
    private init() {
        registerAPIService()
        registerStorage()
    }
    
    public static func bootstrap() {
        _ = DataDIContainer.shared
    }
    
    // MARK: - Register
    
    private func registerAPIService() {
        container.register(instance: APIService.shared)
    }
    
    private func registerStorage() {
        container.register(instance: KeychainStorage.shared as SecureStorage)
        container.register(instance: UserDefaultsStorage.shared as KeyValueStorage)
    }
}
