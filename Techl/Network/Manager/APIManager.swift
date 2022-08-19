//
//  APIManager.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/09.
//

import Foundation
import Alamofire
import SwiftyJSON


class APIManager {
    private init() {}
    
    static let shared = APIManager()
    
    typealias forumCompletionHandler = ([ForumArticle]) -> Void
    typealias forumDetailCompletionHandler = (ForumPost) -> Void
    typealias bookCompletionHandler = ([BookModel]) -> Void
    
    
    
    func homeRequest(completionHandler: @escaping ([HomeBookModel])-> Void) {
        let url = Endpoint.home.getURL()
        
        AF.request(url, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let value) :
                let json = JSON(value)
                print(json)
                
                var booklist: [HomeBookModel] = []
                
                var count = 0
                for item in json["result"].arrayValue {
                    
                    if count < 10 {
                    booklist.append(HomeBookModel(bookIdx: item["bookIdx"].intValue, cover: item["cover"].stringValue, title: item["title"].stringValue, author: item["author"].stringValue, countPost: item["countPost"].intValue, countForum: item["countForum"].intValue))
                    }
                    else { break }
                    count += 1
                    
                }
                
                completionHandler(booklist)
                
            case.failure(let error) :
                print(error.localizedDescription)
            }
        }
    }
    
    func forumRequest(
        completionHandler: @escaping forumCompletionHandler) {
            let url = Endpoint.forum.getURL()
            
            let header: HTTPHeaders = [
                
            ]
            
            let body: Parameters = [
                "bookIdx" : 2
            ]
            
            AF.request(url, method: .get, parameters: body, headers: header ).validate().responseDecodable(of: ForumList.self) { response in
                
                switch response.result {
                case .success(let value) :
                    print("성공 \(value)")
                    completionHandler(value.result.getForumListRes)
                    
                case .failure(let error) :
                    print("실패")
                    print(error.localizedDescription)
                }
            }
        }
    
    func forumDetailRequest(forumIdx: Int, completionHandler: @escaping forumDetailCompletionHandler ) {
        print(forumIdx)
        let url = "\(Endpoint.forum.getURL())/2"
        
        let header: HTTPHeaders = [
            
        ]
        
        let body: Parameters = [
            :
        ]
        
        AF.request(url, method: .get, parameters: body, headers: header ).validate().responseDecodable(of: ForumPostDetail.self) { response in
            
            switch response.result {
            case .success(let value) :
                print("성공 \(value)")
                completionHandler(value.result)
                
            case .failure(let error) :
                print("실패")
                print(error.localizedDescription)
            }
        }
    }
    
    func forumNewPostRequest(title: String, content: String, completionHandler: @escaping () -> Void) {
        let url = "\(Endpoint.forum.getURL())/new-forum/create?bookIdx=2"
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/json",
            "X-ACCESS-TOKEN": "eyJ0eXBlIjoiand0IiwiYWxnIjoiSFMyNTYifQ.eyJ1c2VySWR4Ijo2LCJpYXQiOjE2NjA3NDU1ODMsImV4cCI6MTY2MjIxNjgxMn0.kNqh9zwH3LF3H1xvzTD_hgGy6hiB5YM2FM0RVltB2-4"
        ]
        
        let body: [String:String] = [
            "title" : title,
            "content": content
        ]
        
        AF.request(url, method: .post, parameters: body, encoder: JSONParameterEncoder.prettyPrinted, headers: header).validate().responseData { response in
            switch response.result {
            case .success(let data) :
                print("성공")
                
                let json = JSON(data)
                print("포럼 작성 글 성공", json["message"])
                
                completionHandler()
                
            case .failure(let error) :
                print("실패", error.localizedDescription)
                
            }
        }
    }
    
    func forumNewReplyRequest(content: String, completionHandler: @escaping () -> Void) {
        let url = "\(Endpoint.forum.getURL())/2/new-forum-comment"
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/json",
            "X-ACCESS-TOKEN": "eyJ0eXBlIjoiand0IiwiYWxnIjoiSFMyNTYifQ.eyJ1c2VySWR4Ijo2LCJpYXQiOjE2NjA3NDU1ODMsImV4cCI6MTY2MjIxNjgxMn0.kNqh9zwH3LF3H1xvzTD_hgGy6hiB5YM2FM0RVltB2-4"
        ]
        
        let body: [String:String] = [
            "content": content
        ]
        
        AF.request(url, method: .post, parameters: body, encoder: JSONParameterEncoder.prettyPrinted, headers: header).validate().responseData { response in
            switch response.result {
            case .success(let data) :
                print("성공")
                
                let json = JSON(data)
                print("포럼 댓글 성공", json["message"])
                
                completionHandler()
                
            case .failure(let error) :
                print("실패", error.localizedDescription)
                
            }
        }
    }
    
    
   
}

