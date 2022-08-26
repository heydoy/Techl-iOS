//
//  CircleImageCollectionViewCell.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/24.
//

import UIKit

class CircleImageCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CircleImageCollectionViewCell"
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        imageView.layer.cornerRadius = imageView.frame.height / 2
        
        imageView.image = UIImage(named: "profile-\(Int.random(in: 1...6))")
    }
    
    func configureData(image: String) {
        
        if let image = UIImage(named: image) {
            imageView.image = image
            return
        }
        
        imageView.image = UIImage(named: "profile-2")
        
        
    }

}
