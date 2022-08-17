//
//  ForumTableViewCell.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/16.
//

import UIKit

class ForumTableViewCell: UITableViewCell {
    static let identifier = "ForumTableViewCell"
    
    @IBOutlet weak var sectionTitle: SectionTitle!
    
    @IBOutlet weak var forumContentCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        designUI()
        forumContentCollectionView.collectionViewLayout = collectionViewLayout()
    }
    
    func designUI() {
        sectionTitle.titleLabel.text = "책별 클럽과 포럼"
        sectionTitle.subtitleLabel.text = "내가 원하는 책📕의 클럽과 포럼을 확인해보세요"
    }
    
    func collectionViewLayout() -> UICollectionViewFlowLayout {
        
        let layout = UICollectionViewFlowLayout()
        let width: CGFloat = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: width - 40, height: 140)
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 12
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 20, right: 20)
        
        return layout
    }
}
