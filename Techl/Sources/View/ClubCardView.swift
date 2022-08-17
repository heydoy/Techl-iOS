//
//  ClubCardView.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/10.
//

import UIKit

class ClubCardView: UIView {
    
    @IBOutlet weak var clubImageView: UIImageView!
    @IBOutlet weak var badgeLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationIconImageView: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var startDateLabel: UILabel!
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        let view = UINib(nibName: "ClubCardView", bundle: nil).instantiate(withOwner: self).first as! UIView
        
        view.frame = bounds
        view.backgroundColor = .white
        self.addSubview(view)
        
        designUI()
    }
    
    
    func designUI() {
        self.clipsToBounds = true
        self.layer.cornerRadius = 8
        
        self.statusLabel.layer.cornerRadius = statusLabel.frame.height/3
    }
    
    func configure() {
        clubImageView.image = UIImage()
        badgeLabel.text = " NEW "
        statusLabel.text = " 모집중 2/10 "
        titleLabel.text = "슬기로운 읽기 클럽 🏜"
        locationLabel.text = "온라인 ZOOM"
        descriptionLabel.text =
        """
        클린코드를 읽고 줌(Zoom)에서
        토론하는 시간을 매주 2회 가집니다.
        """
        startDateLabel.text = "8월 16일(수)"
        
        
        
    }
}
