//
//  MultipartDataBuilder.swift
//  EasySchool
//
//  Created by eslam dweeb on 09/01/2024.
//

import Foundation
struct MultipartFormData {
    let data: Data
    let contentType: String
}


class MultipartFormDataBuilder {
    private var parts: [MultipartFormData] = []
    private let boundary = "Boundary-\(UUID().uuidString)"

    func append(value: String, forKey key: String) {
        let part = "--\(boundary)\r\nContent-Disposition: form-data; name=\"\(key)\"\r\n\r\n\(value)\r\n"
        if let data = part.data(using: .utf8) {
            parts.append(MultipartFormData(data: data, contentType: "text/plain"))
        }
    }

    func append(fileData: Data, withName name: String, fileName: String, mimeType: String) {
        let part = "--\(boundary)\r\nContent-Disposition: form-data; name=\"\(name)\"; filename=\"\(fileName)\"\r\nContent-Type: \(mimeType)\r\n\r\n"
        if let data = part.data(using: .utf8) {
            parts.append(MultipartFormData(data: data, contentType: mimeType))
        }
        parts.append(MultipartFormData(data: fileData, contentType: mimeType))
    }

    func build() -> [MultipartFormData] {
        let finalBoundary = "--\(boundary)--\r\n"
        if let data = finalBoundary.data(using: .utf8) {
            parts.append(MultipartFormData(data: data, contentType: "text/plain"))
        }
        return parts
    }

    func getBoundary() -> String {
        return boundary
    }
}
