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

    var userInfo = User()
    
    
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
        designCheckButton()
        nextButtonUI()
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
        nextButtonUI()
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        // 관심기술분야 선택화면으로 이동
        let sb = UIStoryboard(name: "Authentication", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: PreferredITFieldViewController.identifier) as! PreferredITFieldViewController
        
        vc.userInfo = self.userInfo
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    @IBAction func viewTermsOfServiceButtonTapped(_ sender: UIButton) {
        // 이용약관 화면 웹뷰로 띄우기
    }
    
    
    @IBAction func viewPrivacyPolicyButtonTapped(_ sender: UIButton) {
        // 개인정보처리방침 화면 웹뷰로 띄우기
    }
    
    // MARK: - Helpers
    func designCheckButton() {
        allButtonList.forEach {
            
            $0.setImage(UIImage(systemName: "square"), for: .normal)
            $0.setImage(UIImage(systemName: "checkmark.square.fill"), for: .selected)
           
        }
    }
    
    func nextButtonUI() {
        nextButton.layer.cornerRadius = 8
        if allCheckButton.isSelected {
            // 버튼 활성화
            print(#function)
            nextButton.isEnabled = true
            nextButton.backgroundColor = .CustomColor.primaryColor
        } else {
            // 버튼 비활성화
            nextButton.isEnabled = false
            nextButton.backgroundColor = .CustomColor.disabledButtonColor
        }
        
    }
    

}
