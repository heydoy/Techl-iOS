//
//  UIViewController+Extension.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/02.
//

import UIKit

// MARK: Root View Control
extension UIViewController {
    
    func setRootViewController( rootViewController: UIViewController) {
        // 타겟 OS가 iOS 15.0 이상이므로 그 아래는 대응안함
        // if #available(iOS 13.0, *) {}
        if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
         {
            sceneDelegate.window?.rootViewController = rootViewController
        }
        
    }
}

// MARK: Navigation Item
extension UIViewController {
    func setBackButton (_ color: UIColor ) {
        navigationItem.backButtonTitle = ""
        navigationItem.leftBarButtonItem?.tintColor = color
        navigationController?.interactivePopGestureRecognizer?.delegate = self as? UIGestureRecognizerDelegate
        
    }
    
    func setLeftBarButton (_ color: UIColor) {
        navigationItem.leftBarButtonItem?.tintColor = color
        navigationController?.interactivePopGestureRecognizer?.delegate = self as? UIGestureRecognizerDelegate
    }
    
    func setNavigationBarClear() {
        let navigationBar = self.navigationController?.navigationBar
        navigationBar?.backgroundColor = UIColor.clear
            
        navigationBar?.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationBar?.shadowImage = UIImage()
    }
}
