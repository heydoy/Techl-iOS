//
//  HomeViewController.swift
//  Techl
//
//  Created by Doy Kim on 2022/07/25.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    
    @IBOutlet weak var bookListCollectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bannerCollectionView.dataSource = self
        bannerCollectionView.delegate = self
        
        bookListCollectionView.dataSource = self
        bookListCollectionView.delegate = self
        

    }
    
    @IBAction func searchButtonTapped(_ sender: UIBarButtonItem) {
        
        let sb = UIStoryboard(name: "Search", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: NSearchViewController.identifier) as! NSearchViewController
        
        vc.modalPresentationStyle = .formSheet
        self.present(vc, animated: true)
    }
    
    

}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case bannerCollectionView:
            return 3
            
        case bookListCollectionView:
            return 5
            
        default:
            assert(false, "Invalid element type")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case bannerCollectionView:
            guard let cell = bannerCollectionView.dequeueReusableCell(withReuseIdentifier: HomeBannerCollectionViewCell.identifier, for: indexPath) as? HomeBannerCollectionViewCell else { return UICollectionViewCell()}
            return cell
            
        case bookListCollectionView:
            guard let cell = bookListCollectionView.dequeueReusableCell(withReuseIdentifier: BookListCollectionViewCell.identifier, for: indexPath) as? BookListCollectionViewCell else { return UICollectionViewCell() }
            cell.configure()
            return cell
            
        default:
            assert(false, "Invalid element type")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if collectionView == bookListCollectionView {
            switch kind {
              // 1
              case UICollectionView.elementKindSectionHeader:
                // 2
                let headerView = collectionView.dequeueReusableSupplementaryView(
                  ofKind: kind,
                  withReuseIdentifier: BookListHeaderCollectionReusableView.identifier,
                  for: indexPath)

                guard let typedHeaderView = headerView as? BookListHeaderCollectionReusableView
                else { return headerView }
                
                return typedHeaderView
                
              default:
                // 5
                assert(false, "Invalid element type")
              }
        } else {
            assert(false, "Invalid element type")
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case bannerCollectionView:
            print("배너 선택")
        case bookListCollectionView:
            print("책 선택")
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: ForumViewController.identifier) as! ForumViewController
            
            self.navigationController?.pushViewController(vc, animated: true)
            
        default:
            assert(false, "Invalid element type")
        }
    }
    
    
}
