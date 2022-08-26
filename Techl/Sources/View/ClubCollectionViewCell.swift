//
//  ClubCollectionViewCell.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/16.
//

import UIKit

class ClubCollectionViewCell: UICollectionViewCell {
    static let identifier = "ClubCollectionViewCell"
    
    @IBOutlet weak var clubCardView: ClubCardView!

    func configureData(club: ClubModel) {
        clubCardView.clubImageView.image = UIImage(named: club.thumbnail)
        clubCardView.badgeLabel.text = club.badge
        clubCardView.statusLabel.text = club.status
        clubCardView.titleLabel.text = club.title
        clubCardView.locationLabel.text = club.location
        clubCardView.descriptionLabel.text = club.description
        clubCardView.startDateLabel.text = club.startDate
    }
    
}
