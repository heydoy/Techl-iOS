//
//  NSearchViewController.swift
//  Techl
//
//  Created by Doy Kim on 2022/07/17.
//

import UIKit
import Alamofire
import TextFieldEffects

class NSearchViewController: UIViewController {
    // MARK: - Properties
    static let identifier = "NSearchViewController"
    
    var query: String = ""
    let category: String = "280"
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    var resultList = [NBookInfo]()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // 콜렉션 뷰 등록
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // MARK: - Actions
    
    @IBAction func didCloseButtonTapped(_ sender: UIButton) {
        
        self.dismiss(animated: true)
    }
    
    
    @IBAction func didTextFieldEditingChanged(_ sender: TextFieldEffects) {
        
        let text = sender.text ?? ""
        
        self.query = text
    }
    
    @IBAction func didSearchButtonTapped(_ sender: UIButton) {
        
        // doing sth with query
        print("쿼리--->\(query)")
        searchHelper()
        
    }
    
    
    // MARK: - Helpers
    func searchHelper() {
        self.fetchSearchResult ( completionHandler: {[weak self] result in
            guard let self = self else { return } // 일시적으로 self가 strong reference로 만들게 하는 작업
               switch result {
               case let .success(result) :
                   debugPrint("success \(result)")
                   self.resultList = result.items
               case let .failure(error) :
                   debugPrint("error \(error)")
           }
            
        })
        
        collectionView.reloadData()
    }
    
    func fetchSearchResult(
        completionHandler: @escaping (Result<NBookSearchResult, Error>)-> Void
    ) {
        let url = "https://openapi.naver.com/v1/search/book.json"
        let headers: HTTPHeaders = [
            "X-Naver-Client-Id" : "nqIJjtpTJwWwgPHVGkQa",
            "X-Naver-Client-Secret" : "xIgNbrd5qc"
        ]
        let body: Parameters = [
            "query" : self.query,
            "d_titl": self.query,
            "d_catg" : self.category
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
                    let result = try decoder.decode(NBookSearchResult.self, from: data)
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

// MARK: - Extensions

extension NSearchViewController: UICollectionViewDataSource {

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return resultList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NBookResultCell", for: indexPath) as? NBookResultCell else {
            return UICollectionViewCell()
        }
        
        let result = resultList[indexPath.item]
        cell.configure(result)
        
        return cell
    }

    
    // 해당 셀이 눌렸을 때
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 화면 띄우기
    }
    
    
}


extension NSearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let inset: CGFloat = 20
        let width: CGFloat = collectionView.bounds.width - (inset * 2)
        let height: CGFloat = 175
        
        return CGSize(width: width, height: height)
    }
}
