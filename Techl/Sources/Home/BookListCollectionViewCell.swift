//
//  BookListCollectionViewCell.swift
//  Techl
//
//  Created by Doy Kim on 2022/07/25.
//

import UIKit

class BookListCollectionViewCell: UICollectionViewCell {
    static let identifier = "BookListCollectionViewCell"
    
    @IBOutlet weak var bookThumbnailImageView: UIImageView!
    
    @IBOutlet weak var bookmarkButton: UIButton!
    
    
    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var bookAuthorLabel: UILabel!
    
    @IBOutlet weak var bookDescriptionLabel: UILabel!
    
    @IBOutlet weak var clubCountLabel: UILabel!
    
    @IBOutlet weak var forumCountLabel: UILabel!
    
    func configure() {
        self.layer.cornerRadius = 12
        bookThumbnailImageView.layer.shadowOffset = CGSize(width: 2, height: 2)
        bookThumbnailImageView.clipsToBounds = false
        bookThumbnailImageView.layer.shadowRadius = 3
        bookThumbnailImageView.layer.shadowColor = UIColor.black.cgColor
        bookThumbnailImageView.layer.shadowOpacity = 0.16
        
        
        bookmarkButton.layer.cornerRadius = 4
        bookmarkButton.backgroundColor = .clear
        bookmarkButton.setImage(UIImage(systemName: "heart"), for: .normal)
        bookmarkButton.setImage(UIImage(systemName: "heart.fill"), for: .highlighted)
        
        
        
    }
    
    func dataConfigure(book: BookModel) {
        bookTitleLabel.text = book.title
        bookAuthorLabel.text = book.authors
        bookThumbnailImageView.image = UIImage(named: book.cover) ?? UIImage(systemName: "heart.fill")
        
        
        
    }
    
    
}
