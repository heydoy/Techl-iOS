//
//  SearchViewController.swift
//  Techl
//
//  Created by Doy Kim on 2022/07/10.
//

import UIKit
import Alamofire




class SearchViewController: UIViewController {

    // MARK: - Properties
    var query: String = ""
    var page = 10
    var size = 15
    
    
    @IBOutlet weak var searchQuery: UITextField!
    
    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var resultTextView: UITextView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    
    // MARK: - Actions
    
    @IBAction func queryEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        
        self.query = text
        
        
    }
    
    @IBAction func didButtonTapped(_ sender: UIButton) {
        searchHelper()
        
        
    }
    
    // MARK: - Helpers
    
    func searchHelper() {
        self.fetchSearchResult ( completionHandler: {[weak self] result in
            guard let self = self else { return } // 일시적으로 self가 strong reference로 만들게 하는 작업
                       switch result {
                       case let .success(result) :
                           debugPrint("success \(result)")
                           self.configureResult(result: result.documents[0])
                       case let .failure(error) :
                           debugPrint("error \(error)")
           }
            
        })
    }
    
    func configureResult( result: BookInfo) {
        self.resultTextView.text = result.contents
        let url = URL(string: result.thumbnail)
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                self.resultImageView.image = UIImage(data: data!)
            }
        }
    }
    
    func fetchSearchResult(
        completionHandler: @escaping (Result<BookResult, Error>)-> Void
    ) {
        let url = "https://dapi.kakao.com/v3/search/book"
        let headers: HTTPHeaders = [
            "Authorization" : "KakaoAK 90f511f7b5590df7b0841eb5579720f2"
        ]
        let body: Parameters = [
            "query" : self.query

        ]
        
        AF.request(url,
                   method: .get,
                   parameters: body,
                   headers: headers)
        .responseData(completionHandler: { response in
            switch response.result {
            case let .success(data) :
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(BookResult.self, from: data)
                    completionHandler(.success(result))
                    
                } catch {
                    completionHandler(.failure(error))
                }
            case let .failure(error) :
                completionHandler(.failure(error))
            }
            
            
        })
        
        
        
    
    }


}

