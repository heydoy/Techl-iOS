//
//  OnboardingViewController.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/11.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var skipButton: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var nextButtonWidth: NSLayoutConstraint!
    
    let messages: [OnboardingMessage] = OnboardingMessage.messages
    
    var isFinished: Bool = false
    
    var currentIndex: Int = 0 {
        didSet {
            buttonDesignUI()
            skipButton.isHidden = currentIndex ==  messages.count - 1 ? true : false
            if currentIndex < messages.count - 1 {
                isFinished = false
            }
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonDesignUI()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        pageControl.numberOfPages = messages.count
        
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize = .zero
        }
    }
    
    // MARK: - Actions
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {

        let index = currentIndex == messages.count - 1 ? currentIndex : (currentIndex + 1) % 3
        currentIndex = index
        
        collectionView.scrollToItem(at: [0, currentIndex], at: .right, animated: true)
        print(index)
        
        pageControl.currentPage = currentIndex
        
        if isFinished == true {
            let storyboard = UIStoryboard(name: "Authentication", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "ConciergeLoginViewController") as! ConciergeLoginViewController
            
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .crossDissolve
            
            self.present(vc, animated:  true)
        }
        
        if nextButton.currentTitle == "완료" && currentIndex == messages.count - 1 {
            // 완료일 때 화면 이동
            isFinished = true
        }
        

    }
    
    
    
    // MARK: - Helpers
    func buttonDesignUI() {
        nextButton.titleLabel?.font = UIFont(name: "Apple SD Gothic Neo SemiBold", size: 14)
        nextButton.layer.cornerRadius = 8
        
        
        if currentIndex < messages.count - 1 {
            skipButton.isHidden = false
            nextButton.setTitle("다음 ", for: .normal)
            nextButton.setImage(UIImage(systemName:  "chevron.right"), for: .normal)
            nextButton.backgroundColor = .CustomColor.primaryColor
            nextButton.tintColor = .white
            
            
            
        } else { // 완료일 때 화면전환
            skipButton.isHidden = true
            
            nextButton.setTitle("완료", for: .normal)
            nextButton.setImage(UIImage(), for: .normal)
            nextButton.backgroundColor = .CustomColor.primaryColor
            nextButton.tintColor = .white
            nextButton.layer.borderWidth = 0
            
        }
        
        
    }
    
    


}

extension OnboardingViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as? OnboardingCollectionViewCell else { return UICollectionViewCell() }
        
        let message = messages[indexPath.item]
        cell.configure(message)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:  UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = UIScreen.main.bounds.width
        let height: CGFloat = collectionView.bounds.height
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
}

extension OnboardingViewController: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x/scrollView.bounds.width)
        pageControl.currentPage = index
        currentIndex = index
        
        
        
    }
}
