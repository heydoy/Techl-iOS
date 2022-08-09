//
//  ForumEditorViewController.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/09.
//

import UIKit
import Toast

class ForumEditorViewController: UIViewController {
    
    // MARK: - Properties
    static let identifier = "ForumEditorViewController"
    
    @IBOutlet weak var userTextView: UITextView!
    
    @IBOutlet weak var cameraButton: UIButton!
    
    
    var userText: String = ""
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userTextView.textContainerInset = UIEdgeInsets(top: 20, left: 24, bottom: 20, right: 24)
        userTextView.delegate = self

    }
    
    
    @IBAction func cameraButtonTapped(_ sender: UIButton) {
    }
    
    
    

    
    
    @IBAction func finishButtonTapped(_ sender: UIButton) {
        
        // 완료버튼 눌렀을 때 동작
        var style = ToastStyle()
        style.messageColor = .systemGray6
        self.view.makeToast("글쓰기가 완료되었습니다.", duration: 0.7, position: .bottom, title: nil, image: nil, style: style) { didTap in
            self.dismiss(animated: true)
        }
        
        
        
    }
    
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        // 닫기 버튼 눌렀을 때
        
        self.dismiss(animated: true)
        
        
    }
    
}

extension ForumEditorViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        self.userText = textView.text
    }
    
}
