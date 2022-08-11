//
//  String+Extension.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/11.
//

import Foundation

extension String {
    
    // 휴대폰번호 11자리인지 체크
    func isValidPhoneNumber() -> Bool {
        let phoneNumberRegex = #"\d{11}"#
        let phoneNumberTest = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex)
        
        return phoneNumberTest.evaluate(with: self)
    }
    
    func isValidPassword() -> Bool {
        // 8글자 이상, 영어소문자와 숫자 반드시 포함 / 대문자와 특수문자는 옵셔널
        let passwordRegex = #"^(?=.*\d)(?=.*[a-z])(?=.*[a-zA-Z]).{8,}$"#
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        
        return passwordTest.evaluate(with: self)
    }
}
