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
    private init() {}
    
    static let shared = AuthenticationManager()
    
    // 로그인 요청
    func loginRequest(phoneNumber: String, password: String, completionHandler: @escaping (String) -> Void) {
        let url = TechlURL.login.getEndPoint()
        
        let body: [String:String] = [
            "phoneNumber" : phoneNumber,
            "password": password
        ]
        
        AF.request(url, method: .post, parameters: body, encoder: JSONParameterEncoder.prettyPrinted ).validate().responseData { response in
            switch response.result {
            case .success(let data) :
                print("성공")
                
                let json = JSON(data)
                if let statusCode = response.response?.statusCode{
                    print(json, statusCode )
                }
                
                let message = "요청에 성공하였습니다." // enum?
                completionHandler(message)
                
            case .failure(let error) :
                print("실패", error.localizedDescription)
                
            }
        }
        
    }
    
    // 회원가입 요청
    func signupRequest(userInfo: User, completionHandler: @escaping (String) -> Void) {
        let url = TechlURL.signup.getEndPoint()
        
        let body: User = userInfo
        
        AF.request(url, method: .post, parameters: body, encoder: JSONParameterEncoder.prettyPrinted).validate().responseData { response in
            switch response.result {
            case .success(let data) :
                let json = JSON(data)
                print(json)
                
                // jwt 쿠키를 이용해 로그인여부 체크 가능
                completionHandler(json["jwt"].stringValue)
                
                
            case .failure(let error) :
                print(error.localizedDescription)
            }
        }

    }
    
    
    
}
