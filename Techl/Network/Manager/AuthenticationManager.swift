//
//  AuthenticationManager.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/11.
//

import Foundation
import Alamofire
import SwiftyJSON

class AuthenticationManager {
    private init () {}
    
    static let shared = AuthenticationManager()
    
    // 로그인 요청
    func loginRequest(phoneNumber: String, password: String, completionHandler: @escaping (Result <(Int, String), Error>) -> Void ) {
        let url = Endpoint.login.getURL()
        
        let body: [String:String] = [
            "phoneNumber" : phoneNumber,
            "password": password
        ]
        
        AF.request(url, method: .post, parameters: body, encoder: JSONParameterEncoder.prettyPrinted ).validate().responseData { response in
            switch response.result {
            case .success(let data) :
                print("통신 성공")
                
                let json = JSON(data)
                let jwt = json["result"]["jwt"].stringValue
                let code = json["code"].intValue
                    
                completionHandler( .success((code, jwt)) )
                
            case .failure(let error) :
                print("실패", error.localizedDescription)
                completionHandler(.failure(error))
                
            }
        }
        
    }
    
    // 회원가입 요청
    func signupRequest(userInfo: User, completionHandler: @escaping (Result <(Int, String), Error>) -> Void ) {
        let url = Endpoint.signup.getURL()
        
        let body: User = userInfo
        
        AF.request(url, method: .post, parameters: body, encoder: JSONParameterEncoder.prettyPrinted).validate().responseData { response in
            switch response.result {
            case .success(let data) :
                print("통신 성공")
                
                let json = JSON(data)
                let jwt = json["result"]["jwt"].stringValue
                let code = json["code"].intValue
                    
                completionHandler( .success((code, jwt)) )
                
            case .failure(let error) :
                print("실패", error.localizedDescription)
                completionHandler(.failure(error))
                
                
            }
        }

    }
    
    
    
}
