//
//  ForumData.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/09.
//

import Foundation

/* 포럼 리스트 뷰 */
// 요청 링크
// http://118.36.217.243:8080/forum?bookIdx=2
struct ForumList : Codable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: ForumArticles
    
}

struct ForumArticles: Codable {
    var bookIdx: Int
    var title: String
    var getForumListRes: [ForumArticle]
    
}
struct ForumArticle: Codable {
    var forumIdx: Int
    var title: String
    
    var nickName: String
    var countUpvote: Int
    var countComment: Int
    var createdDate: String
    //var contentsImage: String
}

/* 포럼리스트에서 포스트 클릭해서 볼 때 */

// 요청 링크
//http://118.36.217.243:8080/forum/\(forumIdx)
struct ForumPostDetail: Codable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: ForumPost
}

struct ForumPost: Codable {
    
    var bookTitle: String
    var nickName: String

    var countComment: Int
    var createdDate: String
    var title: String
    var content: String
    var contentsImage: String
    
    var getForumCommentRes: [ForumReply]
    
}

struct ForumReply: Codable {
    var nickName: String
    var createdAt: String
    var content: String
    var countUpvote: Int
}
