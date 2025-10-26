//
//  Interceptor.swift
//  Data
//
//  Created by 지연 on 10/26/25.
//

import Foundation

@preconcurrency import Domain
import DIKit

import Alamofire

final class Interceptor: RequestInterceptor {
    private let keychainStorage: SecureStorage
    private let authType: AuthorizationType
    
    init(
        keychainStorage: SecureStorage = KeychainStorage.shared,
        authType: AuthorizationType
    ) {
        self.keychainStorage = keychainStorage
        self.authType = authType
    }
    
    func adapt(
        _ urlRequest: URLRequest,
        for session: Session,
        completion: @escaping (Result<URLRequest, any Error>) -> Void
    ) {
        var request = urlRequest
        
        if authType == .bearer, let accessToken = getAccessToken() {
            request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        }
        
        completion(.success(request))
    }
}

private extension Interceptor {
    func getAccessToken() -> String? {
        return keychainStorage.get(for: .accessToken)
    }
}
