//
//  AlertModel.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/23.
//

import UIKit

struct AlertModel {
    var image: String
    var kind: String
    var content: String
    var date: String
    var buttonText: String
    var buttonLink: String
}

// test용 - dummy data
extension AlertModel {
    static let list: [AlertModel] = [
    
        AlertModel(image: "bookclub-cover-2",
                   kind: "이벤트",
                   content: "가입 이벤트가 3일 뒤에 끝나요!\n지금 참여해보시는 건 어떨까요?😄",
                   date: "2022.08.17",
                   buttonText: "참여하기",
                   buttonLink: ""),
        
        AlertModel(image: "book_thumbnail_2",
                   kind: "북마크",
                   content: "'밑바닥부터 시작하는 딥러닝'에\n새로운 북클럽이 모집중입니다",
                   date: "2022. 08.21",
                   buttonText: "보러가기",
                   buttonLink: ""),
        
        AlertModel(image: "book_thumbnail_1",
                   kind: "북마크",
                   content: "'클린코드'에\n새로운 포럼글이 올라왔습니다",
                   date: "2022. 08.21",
                   buttonText: "보러가기",
                   buttonLink: ""),
        
        AlertModel(image: "profile-1",
                   kind: "이벤트",
                   content: "테클 추천도서 읽고 포럼에 글 남기면\n추첨을 통해 치킨을 드려요!",
                   date: "2022.08.24 ~ ",
                   buttonText: "보러가기",
                   buttonLink: "")
    ]
}
