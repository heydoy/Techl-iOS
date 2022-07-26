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
    
    func configure() {
        self.layer.cornerRadius = 12
        bookmarkButton.layer.cornerRadius = 4
        
    }
}
