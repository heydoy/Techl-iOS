//
//  BookModel.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/09.
//

import Foundation

struct BookModel: Codable {
    var cover: String
    var title: String
    var authors: String
}

struct HomeBookModel {
    var bookIdx: Int
    var cover: String
    var title: String
    var author: String
    var countPost: Int
    var countForum: Int
}

// test용 dummy data
extension HomeBookModel {
    static let list: [HomeBookModel] = [
    HomeBookModel(bookIdx: 203, cover: "https://shopping-phinf.pstatic.net/main_3243612/32436122059.20220527053003.jpg", title: "린 스타트업 (지속적 혁신을 실현하는 창업의 과학)", author: "에릭 리스", countPost: 4, countForum: 17),
    
    HomeBookModel(bookIdx: 187, cover: "https://shopping-phinf.pstatic.net/main_3247419/32474195676.20220524185639.jpg", title: "Clean Code(클린 코드)", author: "로버트 C 마틴", countPost: 6, countForum: 11),
    
    HomeBookModel(bookIdx: 204, cover: "https://shopping-phinf.pstatic.net/main_3243623/32436239326.20220527024713.jpg", title: "이펙티브 자바 3/E", author: "조슈아 블로크", countPost: 3, countForum: 22),
    
    HomeBookModel(bookIdx: 112, cover: "https://shopping-phinf.pstatic.net/main_3372496/33724967619.20220802100858.jpg", title: "소프트 스킬 (평범한 개발자의 비범한 인생 전략 74가지)", author: "존 손메즈", countPost: 3, countForum: 2),
    
    HomeBookModel(bookIdx: 9, cover: "https://shopping-phinf.pstatic.net/main_3248653/32486532054.20220527033921.jpg", title: "밑바닥부터 시작하는 딥러닝 (파이썬으로 익히는 딥러닝 이론과 구현)", author: "사이토 고키", countPost: 0, countForum: 14),
    
    HomeBookModel(bookIdx: 185, cover: "https://shopping-phinf.pstatic.net/main_3249145/32491453506.20220527023918.jpg", title: "클린 아키텍처: 소프트웨어 구조와 설계의 원칙 (살아있는 전설이 들려주는 실용적인 소프트웨어 아키텍처 원칙)", author: "로버트 S 코스", countPost: 2, countForum: 32),
    
    
    HomeBookModel(bookIdx: 260, cover: "https://shopping-phinf.pstatic.net/main_3308537/33085377627.20220702095248.jpg", title: "비즈니스 데이터 과학 (비즈니스 의사결정을 위한 통계학, 경제학, 인공지능의 만남)", author: "맷 태디", countPost: 2, countForum: 14)
    ]
}
