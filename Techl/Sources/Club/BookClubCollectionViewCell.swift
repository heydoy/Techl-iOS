//
//  BookClubCollectionViewCell.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/02.
//

import UIKit

class BookClubCollectionViewCell: UICollectionViewCell {
    static let identifier = "BookClubCollectionViewCell"
    
    @IBOutlet weak var badgeLabel: UILabel!
    @IBOutlet weak var clubStatusLabel: UILabel!
    @IBOutlet weak var clubTitleLabel: UILabel!
    
    @IBOutlet weak var clubLocationIcon: UIImageView!
    @IBOutlet weak var clubLocationLabel: UILabel!
    
    @IBOutlet weak var clubDescriptionLabel: UILabel!
    
    
    @IBOutlet weak var dateInfoLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure() {
        clubStatusLabel.layer.cornerRadius = clubStatusLabel.frame.height/3
    
        self.layer.cornerRadius = 8
    }

}
