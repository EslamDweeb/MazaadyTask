//
//  AuthClient.swift
//  EasySchool
//
//  Created by eslam dweeb on 09/01/2024.
//

import Foundation

protocol AuthService{
    func login(email:String,password:String) async -> Result<LoginDTO,NetworkError>
}

struct AuthClient:HTTPClient,AuthService{
    
    func login(email: String, password: String) async -> Result<LoginDTO, NetworkError> {
        return await sendRequest(request: AuthRouter.login(email: email, password: password), responseModel: LoginDTO.self)
    }
    
    
}
