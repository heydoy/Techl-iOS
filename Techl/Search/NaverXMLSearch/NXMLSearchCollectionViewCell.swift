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
        self.backgroundColor = .white
        self.layer.cornerRadius = 8
        bookTitleLabel.text = book.title
        bookTitleLabel.font = .boldSystemFont(ofSize: 17)
        authorLabel.text = book.author
        descriptionLabel.text = book.description
        
        let url = URL(string: book.image)
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                self.thumbnailImageView.image = UIImage(data: data!)
            }
        }
        // 디자인
        self.thumbnailImageView.layer.cornerRadius = 4
        self.thumbnailImageView.contentMode = .scaleAspectFill
        
    }
}
