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
    
    
    @IBOutlet weak var phoneNumberTextField: HoshiTextField!
    @IBOutlet weak var passwordTextField: HoshiTextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var layupView: UIView!
    
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tappedOuterSpace))
        
        view.addGestureRecognizer(tapGestureRecognizer)

    }
    
    // MARK: - Actions
    
    @IBAction func phoneNumberTextFieldEditingChanged(_ sender: HoshiTextField ) {
        if let text = sender.text {
            self.phoneNumber = text
        }
    }
    
    @IBAction func passwordTextFieldEditingChanged(_ sender: HoshiTextField) {
        if let text = sender.text {
            self.password = text
        }
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        print(#function)
        loginFailure()
    }
    
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    // MARK: - Helpers
    
    @objc
    func tappedOuterSpace(_ sender: UITapGestureRecognizer) {
        print("외부 클릭")
        self.dismiss(animated: true)
    }
    
    func designUI() {
        // 뷰
        layupView.layer.cornerRadius = 12
        layupView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner] // Top right corner, Top left corner respectively

        
        //텍스트필드
        phoneNumberTextField.keyboardType = .asciiCapableNumberPad
        
        // 버튼
        loginButton.layer.cornerRadius = 8
        loginButton.layer.masksToBounds = true

    }
    
    


}


extension LoginViewController {
    
    // 로그인 실패
    func loginFailure() {
        
//        let alert = UIAlertController(title: "로그인 실패", message: "아이디 또는 비밀번호가 일치하지 않습니다.", preferredStyle: .alert)
//
//        let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
//
//        alert.addAction(ok)
//
//        present(alert, animated: true)
        
        var style = ToastStyle()
        style.messageAlignment = .center


        self.view.makeToast("아이디 또는 비밀번호가 일치하지 않습니다.", duration: 1.2, position: .center, title: "로그인 실패", image: UIImage(named: "login-fail"), style: style, completion: nil)
    }
    
    // 회원정보가 일치해서 로그인 성공했을때
    func loginSuccess() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: "MainTabBarViewController") as! MainTabBarViewController
        
        // 이전 뷰를 다 날리는 작업을 해주어야함
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
}
