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
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        let view = UINib(nibName: "BookTechlCardView", bundle: nil).instantiate(withOwner: self).first as! UIView
        
        view.frame = bounds
        view.backgroundColor = .white
        self.addSubview(view)
    }

}
