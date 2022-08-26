//
//  ForumEditorViewController.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/09.
//

import UIKit
import Toast
import YPImagePicker

class ForumEditorViewController: UIViewController {
    
    // MARK: - Properties
    static let identifier = "ForumEditorViewController"
    
    @IBOutlet weak var userTextView: UITextView!
    
    @IBOutlet weak var cameraButton: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    var userText: String = ""
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userTextView.textContainerInset = UIEdgeInsets(top: 20, left: 24, bottom: 20, right: 24)
        userTextView.delegate = self
        
    }
    
    
    @IBAction func cameraButtonTapped(_ sender: UIButton) {
        let picker = YPImagePicker()
        picker.didFinishPicking { [unowned picker] items, _ in
            if let photo = items.singlePhoto {
                print(photo.fromCamera) // Image source (camera or library)
                print(photo.image) // Final image selected by the user
                print(photo.originalImage) // original image selected by the user, unfiltered
                print(photo.modifiedImage) // Transformed image, can be nil
                print(photo.exifMeta) // Print exif meta data of original image.
                
                
                self.imageView.image = photo.image
            }
            picker.dismiss(animated: true, completion: nil)
        }
        present(picker, animated: true, completion: nil)
    }
    
    
    
    
    
    
    @IBAction func finishButtonTapped(_ sender: UIButton) {
        
        // 완료버튼 눌렀을 때 동작
        var style = ToastStyle()
        style.messageColor = .systemGray6
        
        //guard let imageData = imageView.image?.jpegData(compressionQuality: 0.3) else { return }
        
        guard let imageData = imageView.image else { return }
        
        APIManager.shared.forumNewPostWithImageRequest(title: userTextView.text , content: userTextView.text , image: imageData) {
            self.view.makeToast("글쓰기가 완료되었습니다.", duration: 0.7, position: .bottom, title: nil, image: nil, style: style) { didTap in
                self.dismiss(animated: true)
            }
        }
            
            //        // 기존
            //        APIManager.shared.forumNewPostRequest(title: userTextView.text , content: userTextView.text) {
            //
            //            self.view.makeToast("글쓰기가 완료되었습니다.", duration: 0.7, position: .bottom, title: nil, image: nil, style: style) { didTap in
            //                self.dismiss(animated: true)
            //            }
            //        }
            
            
            
            
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
