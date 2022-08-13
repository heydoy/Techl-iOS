//
//  AgreementViewController.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/12.
//

import UIKit

class AgreementViewController: UIViewController {
    // MARK: - Properties
    static let identifier = "AgreementViewController"

    @IBOutlet weak var allCheckButton: UIButton!
    @IBOutlet weak var fourteenCheckButton: UIButton!
    @IBOutlet weak var termsOfServiceCheckButton: UIButton!
    @IBOutlet weak var privacyPolicyCheckButton: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    
    
    var buttons: [UIButton] {
        return [
            fourteenCheckButton,
            termsOfServiceCheckButton,
            privacyPolicyCheckButton
        ]
    }
    
    var allButtonList: [UIButton] {
        [
            allCheckButton,
            fourteenCheckButton,
            termsOfServiceCheckButton,
            privacyPolicyCheckButton
        ]
    }
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        designUI()
    }
    
    // MARK: - Actions
    
    @IBAction func checkButtonsTapped(_ sender: UIButton) {
        // 체크버튼 관리
        // - 토글
        sender.isSelected = !sender.isSelected
        
        // - 전체 동의를 토글하면 나머지버튼도 토글되게
        if sender == allCheckButton {
            if allCheckButton.isSelected {
                buttons.forEach { $0.isSelected = true}
            } else {
                buttons.forEach { $0.isSelected = false }
            }
        } else {
            // 하나라도 꺼지면 전체동의도 꺼지게
            if allCheckButton.isSelected {
                if sender.isSelected == false {
                    allCheckButton.isSelected = false
                }
            } else {
                // 모두 켜져 있으면 전체동의도 활성화
                var numberOfselected = 0
                buttons.forEach {
                    if $0.isSelected {
                        numberOfselected += 1
                    }
                }
                if numberOfselected == buttons.count {
                    allCheckButton.isSelected = true
                }
                
            }
        }
        

    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
    }
    
    
    
    @IBAction func viewTermsOfServiceButtonTapped(_ sender: UIButton) {
        // 이용약관 화면 웹뷰로 띄우기
    }
    
    
    @IBAction func viewPrivacyPolicyButtonTapped(_ sender: UIButton) {
        // 개인정보처리방침 화면 웹뷰로 띄우기
    }
    
    // MARK: - Helpers
    func designUI() {
        allButtonList.forEach {
            
            $0.setImage(UIImage(systemName: "square"), for: .normal)
            $0.setImage(UIImage(systemName: "checkmark.square.fill"), for: .selected)
           
        }
    }
    

}
