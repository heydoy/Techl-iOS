//
//  MyPageViewController.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/17.
//

import UIKit

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
    
    

    

}
