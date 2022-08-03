//
//  HomeViewController.swift
//  Techl
//
//  Created by Doy Kim on 2022/07/25.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    
    @IBOutlet weak var clubListCollectionView: UICollectionView!
    
    @IBOutlet weak var bookListCollectionView: UICollectionView!
    
    // 배너 위의 인덱스 인디케이터
    @IBOutlet weak var bannerIndexView: UIView!
    @IBOutlet weak var bannerIndexLabel: UILabel!
    
    
    // 현재페이지 체크할 용도의 변수
    var currentPage: Int = 0
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //콜렉션 뷰 등록
        
        bannerCollectionView.dataSource = self
        bannerCollectionView.delegate = self
        
        clubListCollectionView.dataSource = self
        clubListCollectionView.delegate = self
        
        bookListCollectionView.dataSource = self
        bookListCollectionView.delegate = self
        
        // 셀 등록
        clubListCollectionView.register(UINib(nibName: String(describing: BookClubCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: BookClubCollectionViewCell.self))
        
        // 디자인
        viewConfigure()
        
        // 네비게이션 컨트롤러 속성
        navigationConfigure()
        
        // 자동 슬라이드
        bannerTimer()
        bannerIndexChange()
    }
    
    // MARK: - Actions
    
    @objc
    func searchButtonTapped(_ sender: UIBarButtonItem) {
        
        let sb = UIStoryboard(name: "Search", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: NXMLSearchViewController.identifier) as! NXMLSearchViewController

        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Helpers
    func viewConfigure() {
        view.backgroundColor = .systemGray6
        bannerCollectionView.backgroundColor = .clear
        bookListCollectionView.backgroundColor = .clear
        
        bannerCollectionView.layer.cornerRadius = 16
        bannerIndexView.layer.cornerRadius = bannerIndexView.frame.height / 2
    }
    
    func navigationConfigure() {
        let searchButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(searchButtonTapped))
        
        let alertButton = UIBarButtonItem(image: UIImage(systemName: "bell"), style: .plain, target: self, action: #selector(searchButtonTapped))
        
        searchButton.tintColor = .black
        alertButton.tintColor = .black
        
        navigationItem.rightBarButtonItems = [alertButton, searchButton]
        
        setBackButton(.CustomColor.secondaryColor)
    }
    
    func bannerIndexChange() {
        
        let index = (currentPage % Banner.banners.count) + 1
        
        bannerIndexLabel.text = "\(index) / \(Banner.banners.count)"
    }
    
    func bannerTimer() {
        let _: Timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { (Timer) in
                    self.bannerMove()
                    self.bannerIndexChange()
                }
    }
    func bannerMove() {
        
        currentPage += 1
        bannerCollectionView.scrollToItem(at: IndexPath(item: currentPage, section: 0) as IndexPath,
                                          at: .right, animated: true)
    
    }
    
    

}
// MARK: - CollectionViews
// Collection View 설정
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // 셀 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case bannerCollectionView:
            return Int.max // Banner.banners.count 개의 배너지만, 무한 스크롤을 위해 바꿔둠
            
        case clubListCollectionView :
            return 5
            
        case bookListCollectionView:
            return 5
            
        default:
            assert(false, "Invalid element type")
        }
    }
    // 아이템 데이터
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case bannerCollectionView:
            guard let cell = bannerCollectionView.dequeueReusableCell(withReuseIdentifier: HomeBannerCollectionViewCell.identifier, for: indexPath) as? HomeBannerCollectionViewCell else { return UICollectionViewCell()}
            cell.configure(Banner.banners[indexPath.item % Banner.banners.count])
            return cell
        
        case clubListCollectionView:
            guard let cell = clubListCollectionView.dequeueReusableCell(withReuseIdentifier: BookClubCollectionViewCell.identifier, for: indexPath) as? BookClubCollectionViewCell else { return UICollectionViewCell() }
            
            cell.configure()
            
            return cell
            
        case bookListCollectionView:
            guard let cell = bookListCollectionView.dequeueReusableCell(withReuseIdentifier: BookListCollectionViewCell.identifier, for: indexPath) as? BookListCollectionViewCell else { return UICollectionViewCell() }
            cell.configure()
            return cell
            
        default:
            assert(false, "Invalid element type")
        }
    }

    
    // 셀 선택되었을 때
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case bannerCollectionView:
            print("배너 선택")
            let sb = UIStoryboard(name: "Home", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: BannerDetailViewController.identifier) as! BannerDetailViewController
            
            let banner = Banner.banners[indexPath.item % Banner.banners.count]
            vc.destinationURL = banner.link
            self.navigationItem.backButtonTitle = ""
            hidesBottomBarWhenPushed = true
            
            print(vc.destinationURL)
            self.navigationController?.pushViewController(vc, animated: true)
            
        case clubListCollectionView:
            print("클럽 선택")
        case bookListCollectionView:
            print("책 선택")
            let sb = UIStoryboard(name: "Book", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: BookInfoViewController.identifier) as! BookInfoViewController
            
            self.navigationController?.pushViewController(vc, animated: true)
            
        default:
            assert(false, "Invalid element type")
        }
    }
    
//    // 셀의 사이즈
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let inset: CGFloat = 20
//        let width: CGFloat = collectionView.frame.width - (inset * 2)
//        let height: CGFloat = 140
//
//        let widthForBanner: CGFloat = collectionView.frame.width
//        let heightForBanner: CGFloat = collectionView.frame.height
//
//        if collectionView == bookListCollectionView {
//            return CGSize(width: width, height: height)
//
//        } else if collectionView == bannerCollectionView {
//            return CGSize(width: widthForBanner, height: heightForBanner )
//
//        } else {
//            assert(false, "Invalid view type")
//        }
//
//    }
    
    // 배너- 스크롤뷰를 통한 애니메이션 (- 감속이 끝났을 때)
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        print(currentPage)
    }

    

    
}


