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
