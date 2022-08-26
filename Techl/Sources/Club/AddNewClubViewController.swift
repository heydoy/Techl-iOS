//
//  AddNewClubViewController.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/24.
//

import UIKit

class AddNewClubViewController: UIViewController {
    static let identifier = "AddNewClubViewController"
    
    @IBOutlet weak var textView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.layer.cornerRadius = 8
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.systemGray5.cgColor
        navigationItem.title = "클럽 만들기"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeButtonTapped))
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveButtonTapped))
        

    }
    
    @objc func saveButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func closeButtonTapped() {
        self.navigationController?.popViewController(animated: true)
        
    }

   

}
