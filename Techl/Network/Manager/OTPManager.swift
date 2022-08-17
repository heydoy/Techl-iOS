//
//  OTPManager.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/14.
//

import Foundation
import Alamofire
import SwiftyJSON

class OTPManager {
    private init() {}
    
    static let shared = OTPManager()
    
    func sendOTP(countryCode: String = "+82", phoneNumber: String) {
        
        let url = "\(TwilioURL.base)Services/\(TWILIO.SERVICE_SID)/Verifications"
        let header: HTTPHeaders = [
            "Content-Type" : "application/x-www-form-urlencoded"
        ]
        let body: [String:String] = [
            "To": countryCode + phoneNumber,
            "Channel": "sms",
        ]
        
        
        AF.request(url, method: .post, parameters: body, encoder: .urlEncodedForm, headers: header ).authenticate(username: TWILIO.ACCOUNT_SID, password: TWILIO.AUTH_TOKEN).validate().responseData { response in
            switch response.result {
            case .success(let value) :
                let json = JSON(value)
                print(json)
                
            case .failure(let error) :
                print(error.localizedDescription)
            }
        }
    }
    
    func validateOTP(countryCode: String = "+82", phoneNumber: String, code: String, completionHandler: @escaping (Bool) -> () ) {
        
        let url = "\(TwilioURL.base)Services/\(TWILIO.SERVICE_SID)/VerificationCheck"
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/x-www-form-urlencoded"
        ]
        
        let body: [String:String] = [
            "To": countryCode + phoneNumber,
            "Code": code
        ]
        

        
        AF.request(url, method: .post, parameters: body, encoder: .urlEncodedForm, headers: header ).authenticate(username: TWILIO.ACCOUNT_SID, password: TWILIO.AUTH_TOKEN).validate().responseData { response in
            switch response.result {
            case .success(let value) :
                let json = JSON(value)
                print(json)
                completionHandler(json["valid"].boolValue)
                
            case .failure(let error) :
                print(error.localizedDescription)
            }
        }
    }
    
    
}
