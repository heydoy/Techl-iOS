//
//  BannerCollectionViewCell.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/16.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bannerView: BannerView!
    
    static let identifier = "BannerCollectionViewCell"
    
    
    
    func configure(_ banner: Banner) {
        bannerView.layer.cornerRadius = 12
        bannerView.clipsToBounds = true
        
        bannerView.bannerImageView.contentMode = .scaleAspectFill
        
        guard let image = UIImage(named: banner.image) else { return }
        bannerView.bannerImageView.image = image
        
    }
    
    
}
