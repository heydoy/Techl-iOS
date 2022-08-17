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

    
    }
    
    @IBAction func nicknameChangeButtonTapped(_ sender: UIButton) {
        print("닉네임 변경")
    }
    
    
    
    @IBAction func goSettingButtonTapped(_ sender: UIButton) {
        print("설정창으로 연결")
    }
    

    

}
