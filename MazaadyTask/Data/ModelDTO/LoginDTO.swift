//
//  LoginDTO.swift
//  EasySchool
//
//  Created by eslam dweeb on 09/01/2024.
//

import Foundation
struct LoginDTO: Codable {
    let id: Int
    let username, email, firstName, lastName: String
    let gender: String
    let image: String
    let token: String
    
    func toDomain()->Login{
        return Login(id: id, username: username, email: email, token: token)
    }
}
