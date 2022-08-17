//
//  LoginViewController.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/11.
//

import UIKit
import TextFieldEffects
import Toast

class LoginViewController: UIViewController {
    // MARK: - Properties
    var phoneNumber = String()
    var password = String()
    
    
    @IBOutlet weak var phoneNumberGuideLabel: UILabel!
    @IBOutlet weak var passwordGuideLabel: UILabel!
    
    
    var isValidPhoneNumber = false {
        didSet {
            self.validateUserInfo()
            self.showPhoneNumberGuideLabel()
        }
    }
    
    var isValidPassword = false {
        didSet {
            self.validateUserInfo()
            self.showPasswordGuideLabel()
        }
    }
    
    @IBOutlet weak var phoneNumberTextField: HoshiTextField!
    @IBOutlet weak var passwordTextField: HoshiTextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var layupView: UIView!
    
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tappedOuterSpace))
        tapGestureRecognizer.delegate = self
        
        view.addGestureRecognizer(tapGestureRecognizer)
        
        
        validateUserInfo()
        designUI()
    }
    
    // MARK: - Actions
    
    @IBAction func phoneNumberTextFieldEditingChanged(_ sender: HoshiTextField ) {
        if let text = sender.text {
            self.phoneNumber = text
            self.isValidPhoneNumber = text.isValidPhoneNumber()
        }
    }
    
    @IBAction func passwordTextFieldEditingChanged(_ sender: HoshiTextField) {
        if let text = sender.text {
            self.password = text
            self.isValidPassword = text.isValidPassword()
        }
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        // 서버통신 후 결과에 따라서 성공/실패 분기
        let success = true //서버통신 결과를 여기서 받기 
        
        if success {
            loginSuccess()
        } else {
            loginFailure()
        }
    }
    
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    // MARK: - Helpers
    
    @objc
    func tappedOuterSpace(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: true)
    }
    
    func designUI() {
        // 뷰
        print(#function)
        layupView.layer.cornerRadius = 12
        layupView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner] // Top right corner, Top left corner respectively
        layupView.layer.masksToBounds = true
        
        //텍스트필드
        phoneNumberTextField.keyboardType = .asciiCapableNumberPad
        phoneNumberTextField.clearsOnBeginEditing = false
        passwordTextField.clearsOnBeginEditing = false

        // 버튼
        loginButton.layer.cornerRadius = 8
        loginButton.layer.masksToBounds = true
        
        // 가이드레이블 hidden
        phoneNumberGuideLabel.isHidden = true
        passwordGuideLabel.isHidden = true
        
    }
    
    private func showPhoneNumberGuideLabel() {
        if isValidPhoneNumber {
            phoneNumberGuideLabel.isHidden = true
        } else {
            phoneNumberGuideLabel.isHidden = false
            phoneNumberGuideLabel.text = "❌ 휴대전화번호는 '-' 없이 11자리로 입력해주세요"
            phoneNumberGuideLabel.textColor = .systemPink
        }
    }
    
    private func showPasswordGuideLabel() {
        if isValidPassword {
            passwordGuideLabel.isHidden = true
        } else {
            passwordGuideLabel.isHidden = false
            passwordGuideLabel.text = "❌ 비밀번호는 알파벳 + 숫자 포함 8자리 이상입니다"
            passwordGuideLabel.textColor = .systemPink
        }
    }
    
    private func validateUserInfo() {
        if isValidPhoneNumber &&
            isValidPassword {
            self.loginButton.isEnabled = true
            UIView.animate(withDuration: 0.33) {
                self.loginButton.backgroundColor = .CustomColor.primaryColor
                self.loginButton.tintColor = .white
            
            }
            
        } else {
            self.loginButton.isEnabled = false
            UIView.animate(withDuration: 0.33) {
                self.loginButton.backgroundColor = .systemGray3
                self.loginButton.tintColor = UIColor.black
            }
        }
    }
}


extension LoginViewController {
    
    // 로그인 실패
    func loginFailure() {
        
        var style = ToastStyle()
        style.messageAlignment = .left
        style.messageColor = .systemGray6
        
        let message = "아이디 또는 비밀번호가 일치하지 않습니다."

        self.view.makeToast(message, duration: 1.2, position: .center, title: "로그인 실패", image: UIImage(named: "login-fail"), style: style, completion: nil)
    }
    
    // 회원정보가 일치해서 로그인 성공했을때
    func loginSuccess() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: "MainTabBarViewController") as! MainTabBarViewController
        
        // 이전 뷰를 다 날리는 작업을 해주어야함
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true)
    }
}

extension LoginViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        guard touch.view?.isDescendant(of: self.layupView) == false else { return false}
        return true
    }
}
