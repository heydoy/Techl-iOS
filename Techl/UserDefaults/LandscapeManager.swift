//
//  LandscapeManager.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/09.
//

import Foundation

class LandscapeManager {
    static let shared = LandscapeManager()
    // 앱이 처음 열린건지 아닌지 체크하는 요소
    var isFirstLaunch: Bool {
        get {
            !UserDefaults.standard.bool(forKey: #function)
        } set {
            UserDefaults.standard.setValue(newValue, forKey: #function)
        }
    }
 
}

class LoginManager {
    // 로그인 여부 체크
    static let shared = LoginManager()
    
    var isLoggedIn: Bool {
        get {
            UserDefaults.standard.bool(forKey: #function)
            
        } set {
            UserDefaults.standard.setValue(newValue, forKey: #function)
        }
    }
    // 로그인 유지상태일 경우 jwt 저장
    var jwt: String? {
        get {
            UserDefaults.standard.string(forKey: "jwt")
        } set {
            UserDefaults.standard.setValue(newValue, forKey: "jwt")
        }
    }
}
