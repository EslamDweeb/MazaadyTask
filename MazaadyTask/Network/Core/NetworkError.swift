//
//  NetworkError.swift
//  EasySchool
//
//  Created by eslam dweeb on 09/01/2024.
//

import Foundation
enum NetworkError: Error {
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case unexpectedStatusCode
    case unknown
    
    var customMessage: String {
        switch self {
        case .decode:
            return "Decode error"
        case .unauthorized:
            return "Session expired"
        default:
            return "Unknown error"
        }
    }
}
