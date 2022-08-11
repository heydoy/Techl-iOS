//
//  BannerView.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/12.
//

import UIKit

class BannerView: UIView {

    @IBOutlet weak var bannerImageView: UIImageView!
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        let view = UINib(nibName: "BannerView", bundle: nil).instantiate(withOwner: self ).first as! UIView
        
        view.frame = bounds
        view.backgroundColor = .clear
        self.addSubview(view)
        
    }
}
