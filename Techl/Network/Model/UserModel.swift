//
//  UserModel.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/11.
//

import Foundation


struct User: Codable {
    var userName: String //유저 이름(null 가능)
    var nickName: String
    var phoneNumber: String //휴대폰 번호(중복 불가능, 특수문자 불가능하고 숫자로 11자리)
    var password: String //비밀번호
    var profileImgUrl: String // 프로필 이미지(null 가능)
    var userJob: String //유저 직업(단일값, null 가능)
    var postUserInterests: [String]//유저 관심사(리스트 형태로 받으며 복수 선택 가능)
    
    init() {
        userName = ""
        nickName = ""
        phoneNumber = ""
        password = ""
        profileImgUrl = ""
        userJob = ""
        postUserInterests = []
    }
}
