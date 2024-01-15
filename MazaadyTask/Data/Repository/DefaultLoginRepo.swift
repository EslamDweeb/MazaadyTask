//
//  DefaultLoginRepo.swift
//  EasySchool
//
//  Created by eslam dweeb on 09/01/2024.
//

import Foundation


class DefaultLoginRepo:AuthRepo {
    
    private let authService = AuthClient()
    
    func login(email: String, password: String) async -> Result<Login, NetworkError> {
        let result =  await authService.login(email: email, password: password)
        return result.map({$0.toDomain()})
    }
}
