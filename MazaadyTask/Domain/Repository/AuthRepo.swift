//
//  AuthRepo.swift
//  EasySchool
//
//  Created by eslam dweeb on 09/01/2024.
//

import Foundation

protocol AuthRepo{
    func login(email:String,password:String) async ->Result<Login,NetworkError>
}
