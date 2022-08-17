//
//  SectionTitle.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/10.
//

import UIKit

class SectionTitle: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var rightChevronImageView: UIImageView!
    
    // 초기화
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupUI()
        
        let view = UINib(nibName: "SectionTitle", bundle: nil).instantiate(withOwner: self).first as! UIView
        
        view.frame = bounds
        view.backgroundColor = .clear
        self.addSubview(view)
        
    }
    
    // UI 셋업
    func setupUI() {
        titleLabel?.textColor = .black
        subtitleLabel?.textColor = .black
        
    }
    
}
