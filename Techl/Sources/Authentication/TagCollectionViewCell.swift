//
//  TagCollectionViewCell.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/07.
//

import UIKit

class TagCollectionHeader: UICollectionReusableView {
    static let identifier = "TagCollectionHeader"
    @IBOutlet weak var sectionHeaderLabel: UILabel!
}

class TagCollectionViewCell: UICollectionViewCell {
    static let identifier = "TagCollectionViewCell"
    
    @IBOutlet weak var tagLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configure()
        
    }

    
    func labelDesign(_ string: String) {
        tagLabel.text = string
    }
    
    func toggleTag(_ tapped: Bool) {
        if tapped {
            pressedConfigure()
        } else {
            configure()
        }
    }
    
    func configure() {
        self.backgroundColor = .white
        self.layer.borderColor = UIColor.darkGray.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 12
        tagLabel.textColor = .black
    }
    
    func pressedConfigure() {
        self.backgroundColor = .CustomColor.primaryColor
        self.layer.borderWidth = 0
        self.layer.cornerRadius = 12
        self.layer.borderColor = UIColor.CustomColor.primaryColor.cgColor
        tagLabel.textColor = .white
    }
    

}
