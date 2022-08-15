//
//  SecondSignupViewController.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/14.
//

import UIKit

class SecondSignupViewController: UIViewController {
    // MARK: - Properties
    static let identifier = "SecondSignupViewController"
    
    var userInfo = User()

    @IBOutlet weak var nextButton: UIButton!
    
    var isValidate = true
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        designButtonUI()
        print(userInfo)
    }
    
    // MARK: - Actions

    @IBAction func nextButtonTapped(_ sender: UIButton) {
        
        let sb = UIStoryboard(name: "Authentication", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: AgreementViewController.identifier) as! AgreementViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Helpers
    func designButtonUI() {
        nextButton.layer.cornerRadius = 8
        if isValidate {
            // 버튼 활성화
            nextButton.isEnabled = true
            nextButton.backgroundColor = .CustomColor.primaryColor
        } else {
            // 버튼 비활성화
            nextButton.isEnabled = false
            nextButton.backgroundColor = .CustomColor.disabledButtonColor
        }
    }
    

}
