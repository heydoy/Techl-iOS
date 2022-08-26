//
//  AlertTableViewCell.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/17.
//

import UIKit

class AlertTableViewCell: UITableViewCell {
    static let identifier = "AlertTableViewCell"
    
    @IBOutlet weak var alertView: AlertView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.backgroundColor = .clear
    }
    
    func configureContent(alert: AlertModel) {
        // 내용 받아서 넣는 메서드
        
        alertView.imageView.image = UIImage(named: alert.image)
        alertView.alertKindLabel.text = alert.kind
        alertView.alertContentLabel.text = alert.content
        alertView.dateLabel.text = alert.date
        //alertView.goButton.setTitle(alert.buttonText, for: .normal)
        
        
    }


}
