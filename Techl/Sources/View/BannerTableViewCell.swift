//
//  BannerTableViewCell.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/16.
//

import UIKit

class BannerTableViewCell: UITableViewCell {
    static let identifier = "BannerTableViewCell"

    @IBOutlet weak var bannerContentCollectionView: UICollectionView!
    
    
    @IBOutlet weak var bannerIndexLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        bannerContentCollectionView.collectionViewLayout = collectionViewLayout()
        bannerContentCollectionView.isPagingEnabled = true
        
    }

    func configure(_ currentIndex : Int) {
        bannerIndexLabel.text = " \(currentIndex) / 3"
    }

    
    func collectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        
        let width = UIScreen.main.bounds.width - 40
        let height = width / 3.74
        
        layout.itemSize = CGSize(width: width, height: height)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        
        return layout
    }

}
