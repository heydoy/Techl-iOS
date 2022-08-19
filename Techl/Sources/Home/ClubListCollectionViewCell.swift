//
//  ClubListCollectionViewCell.swift
//  Techl
//
//  Created by Doy Kim on 2022/07/31.
//

import UIKit

class ClubListCollectionViewCell: UICollectionViewCell {
    static let identifier = "ClubListCollectionViewCell"
    
    @IBOutlet weak var badgeLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var clubTitleLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    
    @IBOutlet weak var clubDescription: UILabel!
    
    @IBOutlet weak var starDateLabel: UILabel!
    
    func configure() {
        self.layer.cornerRadius = 8
    }
}
