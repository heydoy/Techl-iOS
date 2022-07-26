//
//  NXMLBookSearchResult.swift
//  Techl
//
//  Created by Doy Kim on 2022/07/27.
//

import Foundation

struct NXMLBookSearchResult : Codable {

    let lastBuildDate: String
    let total: Int
    let start: Int
    let display: Int
    let items: [NBookInfo]
}

struct NXMLBookInfo: Codable {
    let title: String
    let link: String
    let image: String
    let author: String
    let price: String
    let discount: String
    let publisher: String
    let pubdate: String
    let isbn: String
    let description: String
}
