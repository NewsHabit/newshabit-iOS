//
//  RequestTask.swift
//  Data
//
//  Created by 지연 on 10/26/25.
//

import Foundation

public enum RequestTask {
    case requestPlain
    case requestQuery(Encodable)
    case requestBody(Encodable)
}
