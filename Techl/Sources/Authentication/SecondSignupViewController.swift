//
//  SecondSignupViewController.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/14.
//

import UIKit
protocol ModalDelegate {
    func changeImage(_ value: String)
}

class SecondSignupViewController: UIViewController, ModalDelegate {
    // MARK: - Properties
    static let identifier = "SecondSignupViewController"
    
    let jobList: [String] = [
        "개발자", "디자이너", "기획자",
        "학생", "교육자", "IT업종 외"
    ]
    var jobPickerView = UIPickerView()
    var userInfo = User()
    var selectedImage: String = "" {
        didSet {
            print("Image Changed")
            designUI()
        }
    }
    var nickName: String = ""
    var occupation: String = ""
    
    // 검증용
    var isNicknameValidate: Bool = false {
        didSet {
            nextButtonUI()
        }
    }
    var isOccupationValidate: Bool = false {
        didSet {
            nextButtonUI()
        }
    }

    // IBOutlet
    @IBOutlet weak var occupationTextField: UITextField!
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileSelectButton: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var nicknameGuideLabel: UILabel!
    

    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedImage = "profile-1"

        nextButtonUI()
        nicknameGuideLabel.isHidden = true
        print(userInfo)
        
        occupationTextField.placeholder = "직업을 선택해주세요."
        occupationTextField.backgroundColor = .systemGray6
        occupationTextField.tintColor = .clear

        occupationTextField.inputView = jobPickerView
        
        jobPickerView.delegate = self
        jobPickerView.dataSource = self
    }
    
    
    // MARK: - Actions
    
    @IBAction func selectProfileButtonTapped(_ sender: UIButton) {
        
        let sb = UIStoryboard(name: "Authentication", bundle: nil)
        let presentedVC = sb.instantiateViewController(withIdentifier: ProfileSelectionViewController.identifier) as! ProfileSelectionViewController

        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .overCurrentContext

        presentedVC.delegate = self
        presentedVC.selectedImage = self.selectedImage
        
        present(presentedVC, animated: true)
    }
    
    func changeImage(_ value: String) {
        selectedImage = value
    }
    
    @IBAction func nicknameTextFieldEditingChanged(_ sender: UITextField) {
        
        guard let text = sender.text else { return }
        
        if text.count < 2 {
            nicknameGuideLabel.isHidden = false
            nicknameGuideLabel.text = "❌ 닉네임은 2글자 이상 만들어주세요"
            nicknameGuideLabel.textColor = .systemPink
            isNicknameValidate = false
        } else {
            nicknameGuideLabel.isHidden = false
            nicknameGuideLabel.text = "✅ 유효한 닉네임입니다."
            nicknameGuideLabel.textColor = .systemGray2
            nickName = text
            isNicknameValidate = true
        }
    }
    

    
    

    @IBAction func nextButtonTapped(_ sender: UIButton) {
        
        let sb = UIStoryboard(name: "Authentication", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: AgreementViewController.identifier) as! AgreementViewController
        
        userInfo.nickName = self.nickName
        userInfo.profileImgUrl = self.selectedImage
        userInfo.userJob = self.occupation
        
        vc.userInfo = self.userInfo
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Helpers
    func nextButtonUI() {
        nextButton.layer.cornerRadius = 8
        if isNicknameValidate && isOccupationValidate {
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
        profileImageView.image = UIImage(named: selectedImage )
    }
    

}



extension SecondSignupViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return jobList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return jobList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.occupation = jobList[row]
        self.occupationTextField.text = jobList[row]
        isOccupationValidate = true
    }
    
    
    
}
