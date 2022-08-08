//
//  ConciergeViewController.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/09.
//

import UIKit

class ConciergeViewController: UIViewController {
    static let identifier = "ConciergeViewController"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if LandscapeManager.shared.isFirstLaunch {
            performSegue(withIdentifier: "toOnboarding", sender: nil)
            
            LandscapeManager.shared.isFirstLaunch = true
            
        } else {
            
            performSegue(withIdentifier: "toOnboarding", sender: nil)
            LandscapeManager.shared.isFirstLaunch = true
            
            performSegue(withIdentifier: "toAuthentication", sender: nil)
        }
    }



}
