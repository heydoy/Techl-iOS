//
//  ForumDetailListCollectionViewCell.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/02.
//

import UIKit

class ForumDetailListCollectionViewCell: UICollectionViewCell {
    static let identifier = "ForumDetailListCollectionViewCell"
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // cell design
        
        thumbnailImageView.layer.cornerRadius = thumbnailImageView.frame.size.width/6
        thumbnailImageView.layer.borderColor = UIColor.systemGray6.cgColor
        thumbnailImageView.layer.borderWidth = 1
    }
    
    /* 데이터 받아서 보여주기 */
    
    func configure(post: ForumArticle) {

        // 데이터
        titleLabel.text = post.title
        descriptionLabel.text = "\(post.nickName) | \(post.createdDate) | 좋아요 \(post.countUpvote) | 댓글 \(post.countComment)"
    }
}
