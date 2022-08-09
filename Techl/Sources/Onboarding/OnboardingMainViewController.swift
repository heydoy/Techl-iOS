//
//  OnboardingMainViewController.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/09.
//

import UIKit

class OnboardingMainViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var skipButton: UIButton!
    
    var currentIndex: Int = 0 {
        didSet {
            decoratePageControl(currentIndex: currentIndex)
            nextButtonFigure()
            print("--->", oldValue, currentIndex)
        }
    }
    
    var pageViewController: UIPageViewController!
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        decoratePageControl(currentIndex: currentIndex)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == CarouselPageViewController.identifier {
            print("페이지 뷰 컨트롤러와 메인이 잘 연결되었음")
            guard let vc = segue.destination as? CarouselPageViewController else { return }
            
            
            vc.completeHandler = { result in
                self.currentIndex = result
            }
            self.pageViewController = vc
        }
    }
    
    // MARK: - Actions
    
    @IBAction func pageControlValueChanged(_ sender: UIPageControl) {
        currentIndex = sender.currentPage
        
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        
        currentIndex = currentIndex == 2 ? 2 : currentIndex + 1

    }
    
    
    // MARK: - Helpers
    
    func nextButtonFigure() {
        // 폰트설정 해야함
        
        if currentIndex == 2 {
            nextButton.setTitle("완료", for: .normal)
            nextButton.setImage(UIImage(), for: .normal)
            
        } else {
            nextButton.setTitle("다음", for: .normal)
            nextButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        }
    }
    
    fileprivate func decoratePageControl(currentIndex: Int) {
        //let pc = UIPageControl.appearance(whenContainedInInstancesOf: [CarouselPageViewController.self])
        pageControl.currentPage = currentIndex
        pageControl.currentPageIndicatorTintColor = .CustomColor.primaryColor
        pageControl.pageIndicatorTintColor = .systemGray3
    }

    
    // MARK: - Navigation


}
