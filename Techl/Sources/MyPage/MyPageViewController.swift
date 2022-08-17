//
//  MyPageViewController.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/17.
//

import UIKit

class MyPageViewController: UIViewController {
    static let identifier = "MyPageViewController"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigation()
    
    }
    
    @IBAction func nicknameChangeButtonTapped(_ sender: UIButton) {
        print("닉네임 변경")
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
