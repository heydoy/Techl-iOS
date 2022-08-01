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
    
    
    func configure() {
        self.layer.cornerRadius = 8
    }
}
