//
//  NXMLSearchViewController.swift
//  Techl
//
//  Created by Doy Kim on 2022/07/26.
//

import UIKit
import Alamofire



class NXMLSearchViewController: UIViewController{
    // MARK: - Properties
    static let identifier = "NXMLSearchViewController"
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // 검색을 위한 프로퍼티
    var query: String = "" {
        didSet {
            print("쿼리가 \(oldValue)->\(query)로 바뀜")
        }
    }
    
    var d_catg: String = "280" //컴퓨터, IT 카테고리인데 현재 지원안됨
    
    // 데이터를 받아올  구조체 프로퍼티
    var bookList = NXMLBookSearchResult()
    
    var start = 10

    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //navigationItem.title = "책 검색"
        setNavigationBarClear()
        setLeftBarButton(.CustomColor.secondaryColor)
        setBackButton(.CustomColor.secondaryColor)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        searchBar.delegate = self
        searchBar.backgroundImage = UIImage()
        searchBar.barTintColor = .CustomColor.secondaryColor

        
        view.backgroundColor = .systemGray6
        collectionView.backgroundColor = .clear
    }
    
    // MARK: - Actions

    func searchHelper() {
        self.fetchSearchResult ( completionHandler: {[weak self] result in
            guard let self = self else { return } // 일시적으로 self가 strong reference로 만들게 하는 작업
               switch result {
               case let .success(result) :
                   debugPrint("success \(result)")
                   self.bookList = result
                   self.collectionView.reloadData()
                   
               case let .failure(error) :
                   debugPrint("error \(error)")
           }
            
        })
        
    }
    
    func fetchSearchResult(
        completionHandler: @escaping (Result<NXMLBookSearchResult, Error>)-> Void
    ) {
        let url = "https://openapi.naver.com/v1/search/book_adv"
        let headers: HTTPHeaders = [
            "X-Naver-Client-Id" : NaverAPI.Id,
            "X-Naver-Client-Secret" : NaverAPI.Secret
        ]
        let body: Parameters = [
            "d_titl": self.query,
            "d_catg" : self.d_catg,
            "start" : self.start
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
                    let result = try decoder.decode(NXMLBookSearchResult.self, from: data)
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


// MARK: Collection View
extension NXMLSearchViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    // - 셀
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookList.items.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NXMLSearchCollectionViewCell.identifier, for: indexPath) as? NXMLSearchCollectionViewCell else { return UICollectionViewCell()}
        
        cell.configure(bookList.items[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Search", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: BookDetailViewController.identifier) as! BookDetailViewController
        
        vc.book = bookList.items[indexPath.item]
        vc.navigationItem.title = vc.book.title
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    
    // - 헤더
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        // NXMLSearchCollectionReusableView
        
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: NXMLSearchCollectionReusableView.identifier, for: indexPath) as? NXMLSearchCollectionReusableView else { return UICollectionReusableView()}
            
        if !self.bookList.items.isEmpty {
            header.configure(query: self.query, total: self.bookList.total)
        }
        return header
    }
    
    
    
    
    
}

// MARK: - 검색
// 검색바
extension NXMLSearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
            self.query = text
            searchHelper()
            collectionView.reloadData()
            
        }
    }
    
}


