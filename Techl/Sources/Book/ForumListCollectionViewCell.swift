//
//  ForumListCollectionViewCell.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/24.
//

import UIKit

class ForumListCollectionViewCell: UICollectionViewCell {
    static let identifier = "ForumListCollectionViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var dateAndAuthorLabel: UILabel!
    
    @IBOutlet weak var replyCountLabel: UILabel!
    @IBOutlet weak var likeCountLabel: UILabel!
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        configureUI()
        
    }
    
    func configureUI() {
        self.backgroundColor = .white
        thumbnailImageView.layer.cornerRadius = 8
        thumbnailImageView.layer.borderWidth = 1
        thumbnailImageView.layer.borderColor = UIColor.systemGray5.cgColor
    }
    
    func configureData(post: ForumPost) {
        titleLabel.text = post.title
        contentLabel.text = post.content
        dateAndAuthorLabel.text = "\(post.createdDate) |  \(post.nickName)"
        replyCountLabel.text = "\(post.countComment)"
        likeCountLabel.text = "\(post.countComment * 2)"
        
        // 이미지 없어서 일단 닫아두기
        thumbnailImageView.isHidden = true
    }

}
