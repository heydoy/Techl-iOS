//
//  PostReplyTableViewCell.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/09.
//

import UIKit

class PostReplyTableViewCell: UITableViewCell {
    static let identifier = "PostReplyTableViewCell"
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var contentLabel: UILabel!
    
    @IBOutlet weak var likeButton: UIButton!
    
    @IBOutlet weak var likeCountLabel: UILabel!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /* 데이터 받아와서 보여주기 */
    
    func configure(reply: ForumReply) {
        nameLabel.text = reply.nickName
        contentLabel.text = reply.content
        likeCountLabel.text = "\(reply.countUpvote)"
    }
    
}
