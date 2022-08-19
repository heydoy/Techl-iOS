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
