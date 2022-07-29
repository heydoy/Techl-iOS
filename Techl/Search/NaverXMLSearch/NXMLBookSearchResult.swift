//
//  NXMLBookSearchResult.swift
//  Techl
//
//  Created by Doy Kim on 2022/07/27.
//


// 네이버 책 상세검색
// https://openapi.naver.com/v1/search/book_adv.xml


import Foundation

enum XMLKey: String {
    case title = "title"
    case link = "link"
    case image = "image"
    case author = "author"
    case price = "price"
    case discount = "discount"
    case publisher = "publisher"
    case pubdate = "pubdate"
    case isbn = "isbn"
    case description = "description"
}



struct NXMLBookSearchResult: Codable {

    var lastBuildDate: String //검색결과 생성시간
    var total: Int //검색결과 총 개수
    var start: Int
    var display: Int
    var item: [NXMLBookInfo] //XML에서는 item
}

struct NXMLBookInfo: Codable {
    var title: String //검색어와 일치하는 부분이 태그로 감싸져있음
    var link: String
    var image: String
    var author: String
    var price: String
    var discount: String
    var publisher: String
    var pubdate: String
    var isbn: String
    var description: String //검색어와 일치하는 부분이 태그로 감싸져있음
    
    init() {
        title = ""
        link = ""
        image = ""
        author = ""
        price = ""
        discount = ""
        publisher = ""
        pubdate = ""
        isbn = ""
        description = ""
    }
}


