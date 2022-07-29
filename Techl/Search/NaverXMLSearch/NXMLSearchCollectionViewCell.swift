//
//  NXMLSearchCollectionViewCell.swift
//  Techl
//
//  Created by Doy Kim on 2022/07/27.
//

import UIKit

class NXMLSearchCollectionViewCell: UICollectionViewCell {
    static let identifier = "NXMLSearchCollectionViewCell"
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var bookTitleLabel: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    func configure(_ book: NXMLBookInfo) {
        
        bookTitleLabel.text = book.title
        authorLabel.text = book.author
        descriptionLabel.text = book.description
        
        let url = URL(string: book.image)
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                self.thumbnailImageView.image = UIImage(data: data!)
            }
        }
        
    }
}
