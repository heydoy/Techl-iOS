//
//  NBookResultCell.swift
//  Techl
//
//  Created by Doy Kim on 2022/07/17.
//

import UIKit

class NBookResultCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier = "NBookResultCell"
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var bookmarkButton: UIButton!
    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var authorsLabel: UILabel!
    @IBOutlet weak var bookContentsLabel: UILabel!
    
    
    // MARK: - Actions
    func configure(_ result: NBookInfo) {
        // 아이템 가져와서 셀 뿌리기
        let url = URL(string: result.image)
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                self.thumbnailImageView.image = UIImage(data: data!)
            }
        }
        
        bookTitleLabel.text = result.title
        authorsLabel.text = result.author
        bookContentsLabel.text = result.description

        bookmarkButton.setTitle("", for: .normal)
        
    }
    
    @IBAction func didBoomarkButtonTapped(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            // 눌러서 북마크 됐을 때
            let image = UIImage(systemName: "bookmark.fill")
            sender.setImage(image, for: .normal)
        } else {
            //안됐을 때
            let image = UIImage(systemName: "bookmark")
            sender.setImage(image, for: .normal)
            
        }
    }
    
}
