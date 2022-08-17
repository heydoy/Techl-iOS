//
//  BookTechlCardView.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/10.
//

import UIKit

class BookTechlCardView: UIView {

    @IBOutlet weak var bookImageView: UIImageView!
    
    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var bookAuthorLabel: UILabel!
    @IBOutlet weak var bookDescriptionLabel: UILabel!
    
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var bookmarkButton: UIButton!
    
    @IBOutlet weak var bookclubCount: UILabel!
    @IBOutlet weak var forumCount: UILabel!
    
    @IBOutlet weak var innerBaseView: UIView!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        let view = UINib(nibName: "BookTechlCardView", bundle: nil).instantiate(withOwner: self).first as! UIView
        
        view.frame = bounds
        view.backgroundColor = .white
        self.addSubview(view)
        designUI()
    }
    
    func designUI() {
        self.layer.cornerRadius = 12
        self.clipsToBounds = true
        bookImageView.layer.shadowOffset = CGSize(width: 2, height: 2)
        bookImageView.clipsToBounds = false
        bookImageView.layer.shadowRadius = 3
        bookImageView.layer.shadowColor = UIColor.black.cgColor
        bookImageView.layer.shadowOpacity = 0.16
        
        bookmarkButton.layer.cornerRadius = 4
        bookmarkButton.backgroundColor = .clear
        bookmarkButton.setImage(UIImage(systemName: "heart"), for: .normal)
        bookmarkButton.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        
        innerBaseView.layer.cornerRadius = 6
        innerBaseView.layer.borderColor = UIColor.systemGray6.cgColor
        
        innerBaseView.layer.borderWidth = 1
    }

}
