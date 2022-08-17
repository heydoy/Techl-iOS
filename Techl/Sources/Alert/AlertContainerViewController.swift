//
//  AlertContainerViewController.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/17.
//

import UIKit

class AlertContainerViewController: UIViewController {
    static let identifier = "AlertContainerViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func dismissButtonTapped(_ sender: UIButton) {
        
        dismiss(animated: true)
    }
    

}
