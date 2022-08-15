//
//  Endpoint.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/09.
//

import Foundation

enum Endpoint {
    static let common = "http://118.36.217.243:8080"
    static let forum = "http://118.36.217.243:8080/forum"
    static let login = "http://118.36.217.243:8080/auth/login"
}

enum TechlURL {
    case login
    case signup
    
    func getEndPoint() -> String{
        switch self {
        case .login :
            return "\(Endpoint.common)/auth/login"
        case .signup :
            return "\(Endpoint.common)/auth/join"
        }
    }
}

enum TwilioURL {
    
    static let base = "https://verify.twilio.com/v2/"
}
