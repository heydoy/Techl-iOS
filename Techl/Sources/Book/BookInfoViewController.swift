//
//  BookInfoViewController.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/02.
//

import UIKit
import Kingfisher

class BookInfoViewController: UIViewController {

    static let identifier = "BookInfoViewController"
    
    var booklist: [HomeBookModel] = []
    
    @IBOutlet weak var coverImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var bookclubOngoingCollectionView: UICollectionView!
    
    @IBOutlet weak var bookclubFinishedCollectionView: UICollectionView!
    
    @IBOutlet weak var forumListCollectionView: UICollectionView!
    
    var forumList = ForumPost.list
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        if !booklist.isEmpty {
            configureData()
        }
        
        // 북클럽 목록
        bookclubOngoingCollectionView.delegate = self
        bookclubOngoingCollectionView.dataSource = self
        
        bookclubFinishedCollectionView.delegate = self
        bookclubFinishedCollectionView.dataSource = self
        
        // 북클럽 셀 등록
        bookclubOngoingCollectionView.register(UINib(nibName: CircleImageCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CircleImageCollectionViewCell.identifier)
        
        bookclubFinishedCollectionView.register(UINib(nibName: CircleImageCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CircleImageCollectionViewCell.identifier)
        
        
        // 포럼 글 목록
        forumListCollectionView.delegate = self
        forumListCollectionView.dataSource = self
        
        // 포럼콜렉션 뷰 셀 등록
        forumListCollectionView.register(UINib(nibName: ForumListCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ForumListCollectionViewCell.identifier)
        
    }
    
    // MARK: - Actions
    func configureData() {
        titleLabel.text = booklist[0].title
        authorLabel.text = booklist[0].author
        
        let url = URL(string: booklist[0].cover)
        coverImageView.kf.setImage(with: url)
    }
    
    func configureUI() {
        coverImageView.clipsToBounds = false
        coverImageView.layer.shadowRadius = 3
        coverImageView.layer.shadowColor = UIColor.black.cgColor
        coverImageView.layer.shadowOpacity = 0.16
    }
    
    @IBAction func viewForumButtonTapped(_ sender: UIButton) {
        
    }
    


}


extension BookInfoViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    /// 셀 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == bookclubOngoingCollectionView {
            return 6
        } else if collectionView == bookclubFinishedCollectionView {
            return 3 
        }  else if collectionView == forumListCollectionView {
            return forumList.count
        }  else {
            return 0
        }
    }
    
    /// 셀 구성
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if collectionView == bookclubOngoingCollectionView || collectionView == bookclubFinishedCollectionView {
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CircleImageCollectionViewCell.identifier, for: indexPath) as? CircleImageCollectionViewCell else { return UICollectionViewCell() }
            
            return cell
        } else if collectionView == forumListCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ForumListCollectionViewCell.identifier, for: indexPath) as? ForumListCollectionViewCell else { return UICollectionViewCell() }
            
            if indexPath.item == 2 {
                cell.thumbnailImageView.isHidden = true
            }
            
            cell.configureData(post: forumList[indexPath.item])
            
            
            return cell
        } else {
            return UICollectionViewCell() 
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == bookclubOngoingCollectionView || collectionView == bookclubFinishedCollectionView {
            
            let sb = UIStoryboard(name: "Club", bundle: nil)
            
            let vc = sb.instantiateViewController(withIdentifier: "ClubDetailViewController")
            
            self.navigationController?.pushViewController(vc, animated: true)
            
            
            
        }
        
        
    }
    
    
    /// 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == bookclubOngoingCollectionView || collectionView == bookclubFinishedCollectionView {
            let size: CGFloat = collectionView.frame.height
            
            return CGSize(width: size, height: size)
            
        } else if collectionView == forumListCollectionView {
            let screenWidth: CGFloat = UIScreen.main.bounds.width
            let inset: CGFloat = 12
            let width: CGFloat = screenWidth - ( inset * 2)
            
            return CGSize(width: width, height: 80)
            
        } else {
            return CGSize(width: 0, height: 0)
        }
    }
    
}
