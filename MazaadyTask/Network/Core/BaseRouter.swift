//
//  BaseRouter.swift
//  EasySchool
//
//  Created by eslam dweeb on 09/01/2024.
//

import Foundation

enum HTTPMethod: String {
    case get    = "GET"
    case post   = "POST"
    case put    = "PUT"
    case delete = "DELETE"
    case patch  = "PATCH"
    // Add other methods as needed
}

typealias Parameters = [String: Any]
protocol TargetType {
    var queries: [URLQueryItem]? { get }
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: Parameters? { get }
    var headers: [String: String]? { get }
    var multipartBuilder: MultipartFormDataBuilder? { get }
}

extension TargetType {
    
    
    func asURLRequest() throws -> URLRequest {
        guard let url = URL(string: baseURL + path) else {
            throw NetworkError.invalidURL
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        configureHeaders(&urlRequest)
        configureBodyOrQuieryParam(&urlRequest)
        return urlRequest
    }
    
    private func configureHeaders(_ urlRequest: inout URLRequest) {
        urlRequest.allHTTPHeaderFields = headers
    }
    
    private func configureBodyOrQuieryParam(_ urlRequest: inout URLRequest) {
        switch method {
        case .get:
            configureURLParameters(&urlRequest)
        default:
            if multipartBuilder != nil {
                configureMultipartBody(&urlRequest)
            }else{
                configureParametersBody(&urlRequest)
            }
            
        }
    }
    private func configureURLParameters(_ urlRequest: inout URLRequest) {
        if let  queries {
            var urlComponents = URLComponents(url: urlRequest.url!, resolvingAgainstBaseURL: false)
            urlComponents?.queryItems = queries
            urlRequest.url = urlComponents?.url
        }
    }
    private func configureParametersBody(_ urlRequest: inout URLRequest){
        if let parameters {
            do{
                let jsonData = try? JSONSerialization.data(withJSONObject: parameters)
                urlRequest.httpBody = jsonData
            }
        }
    }
    private func configureMultipartBody(_ urlRequest: inout URLRequest) {
        if let multipartBuilder = multipartBuilder {
            let boundary = multipartBuilder.getBoundary()
            let multipartFormData = multipartBuilder.build()
            let contentType = "multipart/form-data; boundary=\(boundary)"
            
            var bodyData = Data()
            
            if let parameters = parameters {
                for (key, value) in parameters {
                    multipartBuilder.append(value: "\(value)", forKey: key)
                }
            }
            
            for part in multipartFormData {
                bodyData.append(part.data)
            }
            
            urlRequest.httpBody = bodyData
            urlRequest.setValue(contentType, forHTTPHeaderField: "Content-Type")
        }
    }
}
