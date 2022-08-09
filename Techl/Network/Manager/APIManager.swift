//
//  APIManager.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/09.
//

import Foundation
import Alamofire


class APIManager {
    private init() {}
    
    static let shared = APIManager()
    
    typealias forumCompletionHandler = ([ForumArticle]) -> Void
    typealias forumDetailCompletionHandler = (ForumPost) -> Void
    typealias bookCompletionHandler = ([BookModel]) -> Void
    
    
    func forumRequest(
        completionHandler: @escaping forumCompletionHandler) {
            let url = Endpoint.forum
            
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
        let url = "http://118.36.217.243:8080/forum/2"
        
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
    
    
   
}

