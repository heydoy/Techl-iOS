//
//  NXMLSearchViewController.swift
//  Techl
//
//  Created by Doy Kim on 2022/07/26.
//

import UIKit
import Alamofire
import SwiftyXMLParser



class NXMLSearchViewController: UIViewController{
    // MARK: - Properties
    static let identifier = "NXMLSearchViewController"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // 검색을 위한 프로퍼티
    var query: String = "고양이" {
        didSet {
            collectionView.reloadData()
        }
    }
    
    var d_catg: String = "280" //컴퓨터, IT 카테고리
    
    // XML 데이터를 받을 프로퍼티
    var bookList = [NXMLBookInfo]()
    var xmlDictionary: [String:String]?
    var crtElementType: XMLKey?
    
    var lastBuildDate: String = ""
    var total: Int = 0
    var start: Int = 0
    var display: Int = 0
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "책 검색"
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        searchHelper()
        

    }
    
    // MARK: - Actions
    // 검색하기
    

    
    // 수정해야함
    func searchHelper() {
        self.fetchSearchResult ( completionHandler: {[weak self] result in
            guard let self = self else { return } // 일시적으로 self가 strong reference로 만들게 하는 작업
               switch result {
               case let .success(result) :
                   debugPrint("success \(result)")
                   guard let data = result.data(using: .utf8) else { return }
                   
                   let string = String(decoding: data, as: UTF8.self)
                   
                   print("XML을 구조체로 변환 ! - \(String(describing: string))") // 실패~!
                   
                   let xmlData = string.data(using: .utf8)!
                   let parser = XMLParser(data: xmlData)
                   parser.delegate = self
                   parser.parse()
                   print(self.bookList)
                   
               case let .failure(error) :
                   debugPrint("error \(error)")
           }
            
        })
        collectionView.reloadData()
    }
    
    func fetchSearchResult(
        completionHandler: @escaping (Result<String, Error>)-> Void
    ) {
        let url = "https://openapi.naver.com/v1/search/book_adv.xml"
        let headers: HTTPHeaders = [
            "X-Naver-Client-Id" : NaverAPI.Id,
            "X-Naver-Client-Secret" : NaverAPI.Secret
        ]
        let body: Parameters = [
            "d_titl": self.query,
            "d_catg" : self.d_catg
        ]
        
        AF.request(url,
                   method: .get,
                   parameters: body,
                   headers: headers)
        .responseData(completionHandler: { response in
            switch response.result {
            case let .success(data) :
                do {
                    let result = String(data: data, encoding: .utf8)
                    guard let resultData = result else { return }
                    completionHandler(.success(resultData))
                    
                } catch {
                    completionHandler(.failure(error))
                }
            case let .failure(error) :
                completionHandler(.failure(error))
            }
            
        })
    
    
    }

}

extension NXMLSearchViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NXMLSearchCollectionViewCell.identifier, for: indexPath) as? NXMLSearchCollectionViewCell else { return UICollectionViewCell()}
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        // NXMLSearchCollectionReusableView
        
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: NXMLSearchCollectionReusableView.identifier, for: indexPath) as? NXMLSearchCollectionReusableView else { return UICollectionReusableView()}
                
            return header
    }
    
    
    
}

// MARK: - 검색
// 검색바
extension NXMLSearchViewController: UISearchBarDelegate {
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
            self.query = text
            
        }
    }
}

// MARK: - XML 파싱

extension NXMLSearchViewController: XMLParserDelegate {
    // XML 파싱을 시작하는 태그에서 이벤트 핸들링
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        switch elementName {
            
        // item
        case "item" :
            xmlDictionary = [:]
        case XMLKey.title.rawValue :
            crtElementType = .title
        case XMLKey.link.rawValue :
            crtElementType = .link
        case XMLKey.image.rawValue :
            crtElementType = .image
        case XMLKey.author.rawValue :
            crtElementType = .author
        case XMLKey.price.rawValue :
            crtElementType = .price
        case XMLKey.discount.rawValue :
            crtElementType = .discount
        case XMLKey.publisher.rawValue :
            crtElementType = .publisher
        case XMLKey.pubdate.rawValue :
            crtElementType = .pubdate
        case XMLKey.isbn.rawValue :
            crtElementType = .isbn
        case XMLKey.description.rawValue :
            crtElementType = .description
            
        default:
            print(elementName)
        }
        
    }
    
    // 태그 안의 데이터가 String 형태로 들어옴
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        guard xmlDictionary != nil,
            let crtElementType = self.crtElementType else { return }
        
        xmlDictionary?.updateValue(string, forKey: crtElementType.rawValue)
    }
    
    // XML 파싱이 끝나는 태그에서 이벤트 핸들링
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        guard let xmlDictionary = self.xmlDictionary else { return }
        if elementName == "item" {
            var item = NXMLBookInfo()

            guard let title = xmlDictionary[XMLKey.title.rawValue], let link = xmlDictionary[XMLKey.link.rawValue], let image = xmlDictionary[XMLKey.image.rawValue], let author = xmlDictionary[XMLKey.author.rawValue], let price = xmlDictionary[XMLKey.price.rawValue], let discount = xmlDictionary[XMLKey.discount.rawValue], let publisher = xmlDictionary[XMLKey.publisher.rawValue], let pubdate = xmlDictionary[XMLKey.pubdate.rawValue], let isbn = xmlDictionary[XMLKey.isbn.rawValue], let description = xmlDictionary[XMLKey.description.rawValue] else { return }
            
            item.title = title
            item.link = link
            item.image = image
            item.author = author
            item.price = price
            item.discount = discount
            item.publisher = publisher
            item.pubdate = pubdate
            item.isbn = isbn
            item.description = description
            
            self.bookList.append(item)
            self.xmlDictionary = nil
        }
        
        self.crtElementType = nil
    }
}
    

