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

extension ForumPost {
    static let list: [ForumPost] =
    [
        ForumPost(bookTitle: "", nickName: "디디", countComment: 3, createdDate: "2022.08.04", title: "네이밍 컨벤션 중에 귀여워지지 말라는 게 있어요", content: "너무 귀엽지 않나요", contentsImage: "", getForumCommentRes: []),
        ForumPost(bookTitle: "", nickName: "밍", countComment: 5, createdDate: "2022.08.01", title: "어제 슬모 북클럽 후기 올립니다", content: "신사역 카페주에서 모였습니다", contentsImage: "", getForumCommentRes: []),
        ForumPost(bookTitle: "", nickName: "마크", countComment: 5, createdDate: "2022.07.28", title: "챕터 7에 이거 무슨 뜻인가요?", content: "직접 해봤는데 잘 이해가 되질 않네요", contentsImage: "", getForumCommentRes: []),
        ForumPost(bookTitle: "", nickName: "김산", countComment: 0, createdDate: "2022.07.28", title: "같이 스터디하실분~ 북클럽 신청해주세요", content: "슬모 새로 또 엽니다", contentsImage: "", getForumCommentRes: [])

    ]
}
