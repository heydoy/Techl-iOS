//
//  BookSearchResult.swift
//  Techl
//
//  Created by Doy Kim on 2022/07/10.
//

import Foundation

struct BookSearchResult: Codable {
    struct BookInfo: Codable {
        let title: String
        let link: String
        let image: String
        let author: String
        let price: String
        let publisher: String
        let pubdate: String
        let isbn: String
        let description: String
    }
    let lastBuildDate: String
    let total: Int
    let start: Int
    let display: Int
    let items: [BookInfo]
    
}
