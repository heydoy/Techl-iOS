//
//  BookCardCollectionViewCell.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/16.
//

import UIKit
import Kingfisher

class BookCardCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "BookCardCollectionViewCell"
    @IBOutlet weak var bookCardView: BookTechlCardView!
    
    func dataConfigure(_ book: HomeBookModel) {
        
        bookCardView.bookTitleLabel.text = book.title
        bookCardView.bookAuthorLabel.text = book.author
        let url = URL(string: book.cover)
        
        bookCardView.bookImageView.kf.setImage(with: url)
        
        bookCardView.bookclubCount.text = "\(book.countPost)"
        bookCardView.forumCount.text = "\(book.countForum)"
        
    }
    
}
