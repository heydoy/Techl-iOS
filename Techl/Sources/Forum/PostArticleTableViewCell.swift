//
//  PostArticleTableViewCell.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/09.
//

import UIKit

class PostArticleTableViewCell: UITableViewCell {

    static let identifier = "PostArticleTableViewCell"
    
    
    @IBOutlet weak var userThumbnailImageView: UIImageView!
    
    @IBOutlet weak var userNicknameLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var articleContentLabel: UILabel!
    
    
    @IBOutlet weak var replyCountLabel: UILabel!
    
    @IBOutlet weak var shareButton: UIButton!
    
    @IBOutlet weak var bookmarkButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

    
    /* 데이터 받아와서 보여주기 */
    
    func configure(post: ForumPost) {
        userNicknameLabel.text = post.nickName
        dateLabel.text = post.createdDate
        articleContentLabel.text = post.content
        replyCountLabel.text = "\(post.countComment)"

    }
    
}
