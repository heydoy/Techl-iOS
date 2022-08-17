//
//  AlertView.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/17.
//

import UIKit

class AlertView: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var alertKindLabel: UILabel!
    @IBOutlet weak var alertContentLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var goButton: UIButton!
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        let view = UINib(nibName: "AlertView", bundle: nil).instantiate(withOwner: self).first as! UIView
        
        view.frame = bounds
        view.backgroundColor = .clear
        
        self.addSubview(view)
        configureUI()
    }
    
    func configureUI() {
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.systemGray6.cgColor
        imageView.contentMode = .scaleAspectFill
        
        goButton.layer.cornerRadius = goButton.frame.height / 2
        goButton.backgroundColor = .CustomColor.primaryColor
        goButton.tintColor = .white
        
        
        
    }

}
