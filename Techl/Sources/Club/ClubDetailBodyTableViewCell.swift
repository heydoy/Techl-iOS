//
//  ClubDetailBodyTableViewCell.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/24.
//

import UIKit

class ClubDetailBodyTableViewCell: UITableViewCell {
    
    static let identifier = "ClubDetailBodyTableViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var baseView: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        baseView.layer.cornerRadius = 8 
    }
    
}
