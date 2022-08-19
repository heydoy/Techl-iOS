//
//  EmptyView.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/17.
//

import UIKit

class EmptyView: UIView {

    
    @IBOutlet weak var imageView: UIImageView!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        let view = UINib(nibName: "EmptyView", bundle: nil).instantiate(withOwner: self).first as! UIView
        
        view.frame = bounds
        view.backgroundColor = .systemGray6
        
        self.addSubview(view)
    }
    
    func configureImgae(string: String) {
        imageView.image = UIImage(named: string)
    }

}
