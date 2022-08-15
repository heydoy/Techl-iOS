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
    
    var phoneNumber: String = ""
    var verificationCode: String = ""
    var password: String = ""
    
    // 검증용
    var isPhoneValidate: Bool = false {
        didSet {
            validateInfo()
        }
    }
    
    var isPasswordValidate: Bool = false {
        didSet {
            validateInfo()
        }
    }
    
    var limitTime = 180 //3분
    
    // - textfields
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var verificationCodeTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordCheckTextField: UITextField!
    
    // - buttons
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var verificationButton: UIButton!
    @IBOutlet weak var sendCodeButton: UIButton!
    
    // - labels
    @IBOutlet weak var limitTimeLabel: UILabel!
    @IBOutlet weak var verificationGuideLabel: UILabel!
    
    @IBOutlet weak var passwordGuideLabel: UILabel!
    
    @IBOutlet weak var checkPasswordGuideLabel: UILabel!
    
   
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        phoneNumberTextField.delegate = self
        verificationCodeTextField.delegate = self
        
        designUI()
        isVerificationButtonsEnabled()
        validateInfo()
        
    }
    
    // MARK: - Actions
    
    
    @IBAction func phoneNumberTextFieldEditingChanged(_ sender: UITextField) {
        
        guard let text = sender.text else { return }
        
        if text.count >= 11 && Int(text) != nil {
            sendCodeButton.isEnabled = true
            isVerificationButtonsEnabled()
            phoneNumber = text
            
        } else {
            sendCodeButton.isEnabled = false
            isVerificationButtonsEnabled()
        }
    }
    
    @IBAction func sendCodeButton(_ sender: UIButton) {
        
        // alert 띄우기
        let alert = UIAlertController(title: "인증번호 전송", message: "\(phoneNumber) 로 인증번호를 보내시겠습니까?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "보내기", style: .default) { action in
            // 확인 누르면 api 호출
            OTPManager.shared.sendOTP(phoneNumber: self.phoneNumber)
            
            // 시간제한 타이머도 시작
            self.limitTimeLabel.isHidden = false
            self.getSetTime()
            
            // 인증번호 전송 비활성화, 인증확인 활성화
            self.sendCodeButton.isEnabled = false
            self.verificationButton.isEnabled = true
            self.isVerificationButtonsEnabled()
            
            // 밑에 가이드레이블도 띄우기
            self.verificationGuideLabel.isHidden = false
            self.verificationGuideLabel.text = "✳︎ 3분 이내로 인증번호 4자리를 입력해주세요"
            self.verificationGuideLabel.textColor = .systemGray2
            
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        present(alert, animated: true)
        
        self.isPhoneValidate = false
    }
    
    @IBAction func verificationTextFieldEditingChanged(_ sender: UITextField) {
        
        guard let text = sender.text else { return }
        
        if text.count >= 4 && Int(text) != nil {
            verificationButton.isEnabled = true
            verificationCode = text
        } else {
            verificationButton.isEnabled = false
        }
        isVerificationButtonsEnabled()
    }
    
    
    
    @IBAction func verificationButtonTapped(_ sender: UIButton) {
        
        // 4글자 번호인지 체크
        
        OTPManager.shared.validateOTP(phoneNumber: phoneNumber, code: verificationCode) { result in
            if result {
                // 성공할 경우 인증완료 메시지 띄우고 인증버튼 비활성화
                self.view.makeToast("인증에 성공하였습니다.", duration: 1.0, position: .center) { didTap in
                    self.verificationButton.isEnabled = false
                    self.isVerificationButtonsEnabled()
                    // 0으로 만들어서 타이머호출 종료
                    self.limitTime = 0
                    
                }
                // 가이드 레이블 변경하기
                self.verificationGuideLabel.text = "✅ 인증이 완료되었습니다."
                self.verificationGuideLabel.textColor = .systemGray2
                
                self.isPhoneValidate = true
                
            } else {
                // 실패할 경우
                self.view.makeToast("인증에 실패하였습니다.\n인증번호 또는 휴대폰 번호가 유효한지 확인하세요", duration: 1.0, position: .center)
                self.isPhoneValidate = false
            }
        }
    }
    
    @IBAction func passwordFieldEditingChanged(_ sender: UITextField) {
        guard let text = sender.text else { return }
        
        if text.isValidPassword() {
            passwordGuideLabel.text = "✅ 유효한 비밀번호입니다."
            passwordGuideLabel.textColor = .systemGray2
            
            password = text
            passwordCheckTextField.isEnabled = true
            passwordGuideLabel.isHidden = false
            checkPasswordGuideLabel.isHidden = true
            
        } else {
            
            passwordGuideLabel.text = "❌ 8자 이상 알파벳과 숫자로 비밀번호를 만들어주세요"
            passwordGuideLabel.textColor = .systemPink
            password = ""
            passwordCheckTextField.isEnabled = false
            passwordGuideLabel.isHidden = false
            checkPasswordGuideLabel.isHidden = true
        }
        
    }
    
    @IBAction func passwordCheckFieldEditingChanged(_ sender: UITextField) {
        
        guard let text = sender.text else { return }
        
        if text == password {
            checkPasswordGuideLabel.text = "✅ 비밀번호가 일치합니다"
            checkPasswordGuideLabel.textColor = .systemGray2
            isPasswordValidate = true
            checkPasswordGuideLabel.isHidden = false
        } else {
            checkPasswordGuideLabel.text = "❌ 비밀번호가 일치하지 않습니다"
            checkPasswordGuideLabel.textColor = .systemPink
            isPasswordValidate = false
            checkPasswordGuideLabel.isHidden = false
        }
        
        
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        // 클릭 시 유저정보 전달 및 VC 이동
        
        var userInfo = User()
        userInfo.phoneNumber = phoneNumber
        userInfo.password = password
        
        let sb = UIStoryboard(name: "Authentication", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: SecondSignupViewController.identifier) as! SecondSignupViewController
        
        vc.userInfo = userInfo
        
        self.navigationController?.pushViewController(vc, animated: true)

        
    }
    
    // MARK: - Helpers
    @objc
    func getSetTime() {
        secToTime(sec: limitTime)
        limitTime -= 1
        
    }
    
    func secToTime(sec: Int) {
        let minute = (sec % 3600) / 60
        let second = (sec % 3600 ) % 60
        
        if second < 10 {
            limitTimeLabel.text = "0\(minute):0\(second)"
        } else {
            limitTimeLabel.text = "0\(minute):\(second)"
        }
        
        if limitTime != 0 {
            // 1초마다 바뀌어야 하므로 1초마다 호출
            perform(#selector(getSetTime), with: nil, afterDelay: 1.0)
        } else if limitTime == 0 {
            // 제한시간이 되면 초를 없애고, 인증하기 버튼도 비활성화
            limitTimeLabel.isHidden = true
            verificationButton.isEnabled = false
            isVerificationButtonsEnabled()
        }
        
    }
    
    
    
 
    
    func isVerificationButtonsEnabled() {
        
        verificationButton.tintColor = .white
        sendCodeButton.tintColor = .white
   
        
        verificationButton.backgroundColor = verificationButton.isEnabled ? .CustomColor.secondaryColor :  .CustomColor.disabledButtonColor
        
        sendCodeButton.backgroundColor = sendCodeButton.isEnabled ? .CustomColor.primaryColor :
            .CustomColor.disabledButtonColor
        
    }
    
    func designUI() {
        nextButton.layer.cornerRadius = 8
        verificationButton.layer.cornerRadius = 8
        sendCodeButton.layer.cornerRadius = 8
        
        limitTimeLabel.isHidden = true
        verificationGuideLabel.isHidden = true
        passwordGuideLabel.isHidden = true
        checkPasswordGuideLabel.isHidden = true
        
        sendCodeButton.isEnabled = false
        verificationButton.isEnabled = false
        passwordCheckTextField.isEnabled = false
        
        verificationCodeTextField.textContentType = .oneTimeCode
    }
    
    func validateInfo() {
        if isPhoneValidate && isPasswordValidate {
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

extension FirstSignUpViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var maxlength: Int = 0
        if textField == phoneNumberTextField { maxlength = 11 }
        else if textField == verificationCodeTextField { maxlength = 4 }
        
        
        guard let text = textField.text else { return false }
        
        if text.count == maxlength {
            return false
        } else {
            return true
        }
        
    }
    
}
