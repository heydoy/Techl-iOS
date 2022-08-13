//
//  FirstSignUpViewController.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/14.
//

import UIKit

class FirstSignUpViewController: UIViewController {
    // MARK: - Properties
    static let identifier = "FirstSignUpViewController"
    
    
    
    @IBOutlet weak var nextButton: UIButton!
    
    var isValidate = true
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        
        designButtonUI()
        designUI()
    }
    
    // MARK: - Actions
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        
        let sb = UIStoryboard(name: "Authentication", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: SecondSignupViewController.identifier) as! SecondSignupViewController
        
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
    
    func designUI() {
        
    }



}
