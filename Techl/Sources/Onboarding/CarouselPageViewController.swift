//
//  CarouselPageViewController.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/09.
//

import UIKit

class CarouselPageViewController: UIPageViewController {
    
    // MARK: - Properties
    static let identifier = "CarouselPageViewController"
    var completeHandler: ((Int) ->())?
    fileprivate var itemList: [UIViewController] {
        let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
        
        let vc1 = storyboard.instantiateViewController(withIdentifier: FirstPageViewController.identifier) as! FirstPageViewController
        let vc2 = storyboard.instantiateViewController(withIdentifier: SecondPageViewController.identifier) as! SecondPageViewController
        let vc3 = storyboard.instantiateViewController(withIdentifier: ThirdPageViewController.identifier) as! ThirdPageViewController
        
        return [vc1, vc2, vc3]
        
    }
    
    var currentIndex: Int {
        guard let vc = viewControllers?.first else { return 0 }
        return itemList.firstIndex(of: vc) ?? 0
    }
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        
        if let firstvc = itemList.first {
            self.setViewControllers([firstvc],
                                    direction: .forward,
                                    animated: true,
                                    completion: nil)
        }
        
    }
    
    // MARK: - Actions
    
    
    // MARK: - Helpers
    



}

extension CarouselPageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func setViewcontrollersFromIndex(index : Int){
          if index < 0 && index >= itemList.count {return }
        
        self.setViewControllers([itemList[index]], direction: .forward, animated: true, completion: nil)
        
        completeHandler?(currentIndex)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            completeHandler?(currentIndex)
        }
    }
    
   
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = itemList.firstIndex(of: viewController) else { return nil }
                
        let previousIndex = index - 1
        
        if previousIndex < 0 { return nil }
        
        return itemList[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = itemList.firstIndex(of: viewController) else {return nil}
                      
        let nextIndex = index + 1
              
        if nextIndex == itemList.count { return nil }
              
        return itemList[nextIndex]
    }
    
    
}
