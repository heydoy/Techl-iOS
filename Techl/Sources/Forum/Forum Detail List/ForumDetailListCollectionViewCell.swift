//
//  ForumDetailListCollectionViewCell.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/02.
//

import UIKit

class ForumDetailListCollectionViewCell: UICollectionViewCell {
    static let identifier = "ForumDetailListCollectionViewCell"
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func configure() {
        // cell design
        
        thumbnailImageView.layer.cornerRadius = thumbnailImageView.frame.size.width/6
        thumbnailImageView.layer.borderColor = UIColor.systemGray6.cgColor
        thumbnailImageView.layer.borderWidth = 1
        
        
    }
}
