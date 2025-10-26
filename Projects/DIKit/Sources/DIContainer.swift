//
//  DIContainer.swift
//  DIKit
//
//  Created by 지연 on 10/26/25.
//

import Foundation

public class DIContainer {
    public static let shared = DIContainer()
    
    private var instances: [ObjectIdentifier: Any] = [:]
    private let lock = NSLock()
    
    private init() {}
    
    // MARK: - Register
    
    public func register<T>(instance: T) {
        let key = ObjectIdentifier(type(of: instance))
        
        lock.lock()
        defer { lock.unlock() }
        
        instances[key] = instance
        print("[DIContainer] \(T.self) 등록 완료")
    }
    
    // MARK: - Resolve
    
    public func resolve<T>() -> T {
        let key = ObjectIdentifier(T.self)
        
        lock.lock()
        defer { lock.unlock() }
        
        if let instance = instances[key] as? T { return instance }
        
        fatalError("[DIContainer] \(T.self) 없음 !!!")
    }
}
