//
//  BookSearchResult.swift
//  Techl
//
//  Created by Doy Kim on 2022/07/10.
//

import Foundation

struct BookResult: Codable {
    
    let documents: [BookInfo]
}


struct BookInfo: Codable {
    let authors: [String]  // 작가들 배열
    let contents: String  //소개글
    let datetime: String //출간일?
    let isbn: String // ISBN
    let price: Int // 정상가
    let publisher: String // 출판사
    let sale_price: Int // 세일가
    let status: String // 정상판매 여부
    let thumbnail: String // 이미지링크
    let title: String // 책제목
    let translators: [String] // 번역가 배열
    let url: String // 책검색결과 링크
}


