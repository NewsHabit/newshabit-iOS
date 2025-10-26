//
//  AuthorizationType.swift
//  Data
//
//  Created by 지연 on 10/26/25.
//

import Foundation

public enum AuthorizationType: Sendable {
    case none
    case bearer // Authorization: Bearer <토큰> 추가
}
