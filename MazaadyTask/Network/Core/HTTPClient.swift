//
//  HTTPClient.swift
//  EasySchool
//
//  Created by eslam dweeb on 09/01/2024.
//

import Foundation
protocol HTTPClient {
    func sendRequest<T: Decodable>(request: TargetType, responseModel: T.Type) async -> Result<T, NetworkError>
}

extension HTTPClient {
    func sendRequest<T: Decodable>(
        request: TargetType,
        responseModel: T.Type
    ) async -> Result<T, NetworkError> {
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request.asURLRequest(), delegate: nil)
            guard let response = response as? HTTPURLResponse else {
                return .failure(.noResponse)
            }
            print("RequestData:",String(data: data, encoding: .utf8) ?? "WTF")
            switch response.statusCode {
            case 200...299:
                guard let decodedResponse = try? JSONDecoder().decode(responseModel, from: data) else {
                    return .failure(.decode)
                }
                return .success(decodedResponse)
            case 401:
                return .failure(.unauthorized)
            default:
                return .failure(.unexpectedStatusCode)
            }
        } catch {
            return .failure(.unknown)
        }
    }
}
