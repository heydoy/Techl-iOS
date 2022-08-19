//
//  MyPageViewController.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/17.
//

import UIKit
import Toast

class MyPageViewController: UIViewController {
    static let identifier = "MyPageViewController"
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var forumActivityBaseView: UIView!
    @IBOutlet weak var clubActivityBaseView: UIView!
    @IBOutlet weak var bookmarkActivityBaseView: UIView!
    
    var viewList: [ UIView ] { [ forumActivityBaseView, clubActivityBaseView, bookmarkActivityBaseView
        ]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigation()
        configureUI()
    }
    
    @IBAction func nicknameChangeButtonTapped(_ sender: UIButton) {
        print("닉네임 변경")
    }
    
    func configureUI() {
        
        profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
        
        viewList.forEach {
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 12
            $0.layer.borderColor = UIColor.systemGray6.cgColor
            $0.layer.borderWidth = 1
        }
    }
    
    
    func configureNavigation() {
        let setting = UIBarButtonItem(image: UIImage(systemName: "gearshape.fill"), style: .plain, target: self, action: #selector(settingButtonTapped))
        setting.tintColor = .black
        
        navigationItem.rightBarButtonItems = [setting]

    }
    
    @objc
    func settingButtonTapped(_ sender: UIBarButtonItem) {
        print("세팅 버튼 선택됨")
    }
    
    
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        
        // 로그아웃 알림
        let alert = UIAlertController(title: "로그아웃 하시겠습니까?", message: nil, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "확인", style: .destructive) { action in
            self.view.makeToast("로그인 화면으로 돌아갑니다.", duration: 0.2, position: .center, title: nil, image: nil, style: ToastStyle()) { didTap in
                self.backToLogin()
            }
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(cancel)
        alert.addAction(ok)
        
        self.present(alert, animated: true)
        
        
        
    }
    
    func backToLogin() {
        // 확인 눌렀을 시에만 로그아웃하도록 사용
        
        let storyboard = UIStoryboard(name: "Authentication", bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: ConciergeLoginViewController.identifier ) as! ConciergeLoginViewController
        
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        
        // 기존 뷰를 다 날리는 작업이 필요함
        
        self.present(vc, animated: true)
    }
    
    

}
