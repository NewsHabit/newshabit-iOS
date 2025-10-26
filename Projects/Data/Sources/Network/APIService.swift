//
//  APIService.swift
//  Data
//
//  Created by 지연 on 10/26/25.
//

import Combine
import Foundation

import Alamofire

public final class APIService {
    public static let shared = APIService()
    
    private init() {}
    
    public func request<T: Decodable>(
        _ target: APITarget,
        responseType: T.Type
    ) -> AnyPublisher<Result<T, AFError>, Never> {
        let decoder = JSONDecoder()
        
        return AF
            .request(target, interceptor: Interceptor(authType: target.authType))
            .responseString(encoding: .utf8) { [weak self] response in
                guard case let .success(rawString) = response.result else { return }
                print("📮 RESPONSE:", target.endPoint)
                self?.printRawString(rawString)
            }
            .publishDecodable(type: responseType, decoder: decoder)
            .value()
            .map { .success($0) }
            .catch { error in Just(.failure(error)) }
            .eraseToAnyPublisher()
    }
    
    private func printRawString(_ rawString: String) {
        if let jsonData = rawString.data(using: .utf8),
           let jsonObject = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers),
           let prettyPrintedData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted),
           let prettyPrintedString = String(data: prettyPrintedData, encoding: .utf8) {
            print(prettyPrintedString, "\n")
        } else {
            print(rawString, "\n")
        }
    }
}
