//
//  HomeBannerCollectionViewCell.swift
//  Techl
//
//  Created by Doy Kim on 2022/07/25.
//

import UIKit

class HomeBannerCollectionViewCell: UICollectionViewCell {
    static let identifier = "HomeBannerCollectionViewCell"
    
    @IBOutlet weak var bannerImageView: UIImageView!
    
    
    
    func configure(_ banner: Banner) {
        
        bannerImageView.contentMode = .scaleAspectFill
        
        guard let image = UIImage(named: banner.image) else { return }
        bannerImageView.image = image
        
    }
}
