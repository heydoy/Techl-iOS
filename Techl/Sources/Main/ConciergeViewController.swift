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
        
        if LandscapeManager.shared.isFirstLaunch == false {
            performSegue(withIdentifier: "toOnboarding", sender: nil)
            
            LandscapeManager.shared.isFirstLaunch = true
            
        } else {
            if LoginManager.shared.jwt == nil {
                performSegue(withIdentifier: "toOnboarding", sender: nil)
                //performSegue(withIdentifier: "toAuthentication", sender: nil)
                
            } else {
                // 로그인 되어있는 상태면 바로 메인으로 이동
                // 기존 뷰 날리는 작업이 필요함
                performSegue(withIdentifier: "toMain", sender: nil)
            }
        }
    }



}
