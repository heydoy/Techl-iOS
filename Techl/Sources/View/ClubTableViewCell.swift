//
//  ClubTableViewCell.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/16.
//

import UIKit

class ClubTableViewCell: UITableViewCell {
    static let identifier = "ClubTableViewCell"
    
    
    @IBOutlet weak var sectionTitle: SectionTitle!
    
    @IBOutlet weak var clubContentCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        designUI()
        clubContentCollectionView.collectionViewLayout = collectionViewLayout()
    }
    
    func designUI() {
        sectionTitle.titleLabel.text = "요즘 인기 북클럽"
        sectionTitle.subtitleLabel.text = "다른 사람들고 함께 책을 읽어요💪"
    }

    
    func collectionViewLayout() -> UICollectionViewFlowLayout {
        
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 170, height: 240)
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 12
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        return layout
    }

}
