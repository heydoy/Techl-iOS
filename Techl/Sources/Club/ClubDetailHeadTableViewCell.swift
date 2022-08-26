//
//  ClubDetailHeadTableViewCell.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/24.
//

import UIKit

class ClubDetailHeadTableViewCell: UITableViewCell {
    
    static let identifier = "ClubDetailHeadTableViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateAndLocationLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        coverImageView.layer.borderColor = UIColor.systemGray5.cgColor
        coverImageView.layer.borderWidth = 1
    }
    
    func configureData() {
        
    }
    
    

   
    
}
