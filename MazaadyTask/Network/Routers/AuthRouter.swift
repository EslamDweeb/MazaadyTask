//
//  AuthRouter.swift
//  EasySchool
//
//  Created by eslam dweeb on 09/01/2024.
//

import Foundation
enum AuthRouter:TargetType{
    case login(email:String,password:String)
}
extension AuthRouter{
    var queries: [URLQueryItem]?{
        switch self {
        case .login:
            return nil
        }
    }
    
    var baseURL: String{
       return "https://dummyjson.com"
    }
    
    var path: String{
        switch self {
        case .login:
            return "/auth/login"
        }
    }
    
    var method: HTTPMethod{
        switch self {
        case .login:
            return .post
        }
    }
    
    var parameters: Parameters?{
        switch self {
        case .login(let email,let password):
            return ["username":email,"password":password]
        }
    }
    
    var headers: [String : String]?{
        switch self {
        case .login:
            return ["Content-Type": "application/json"]
        }
    }
    
    var multipartBuilder: MultipartFormDataBuilder?{
        switch self {
        case .login:
            return nil
        }
    }
}
