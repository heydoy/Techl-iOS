//
//  Documents.swift
//  Techl
//
//  Created by Doy Kim on 2022/07/31.
//

import Foundation


enum Document {
    case termsOfService
    case privacyPolicy
    
    func getLink() -> String {
        switch self {
        case .termsOfService :
            return "https://kimdee.notion.site/41b9060bc8c54c11a59886615d40f2cd"
        case .privacyPolicy :
            return "https://kimdee.notion.site/95cdff9427644d36bb1956a2e4b1a6e4"
        }
    }
}

