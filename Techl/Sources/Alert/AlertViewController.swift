//
//  AlertViewController.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/17.
//

import UIKit
import Tabman
import Pageboy

class AlertViewController: TabmanViewController, PageboyViewControllerDataSource, TMBarDataSource {
    // MARK: - Properties
    static let identifier = "AlertViewController"
    private var viewControllers: Array<UIViewController> = []
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appendVCList()
        
        self.dataSource = self
        
        // 상단 탭바 만들기
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap // 커스텀
        
        // 뷰에 바 추가
        settingTabBar(ctBar: bar)
        addBar(bar, dataSource: self, at: .top)
        
    }
    
    // MARK: - Actions
    
    
    
    // MARK: - Helpers
    func appendVCList() {
        // 탭에 따라 보여줄 화면 추가
        let sb = UIStoryboard(name: "Alert", bundle: nil)
        let vc1 = sb.instantiateViewController(withIdentifier: AllAlertViewController.identifier) as! AllAlertViewController
        
        let vc2 = sb.instantiateViewController(withIdentifier: BookmarkAlertViewController.identifier ) as! BookmarkAlertViewController
        

        
        viewControllers.append(vc1)
        viewControllers.append(vc2)
    }



}

extension AlertViewController {
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        switch index {
        case 0 :
            return TMBarItem(title: " 전체 ")
        case 1 :
            return TMBarItem(title: "북마크")
        default:
            let title = "page\(index)"
            return TMBarItem(title: title)
        }
    }
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
    func settingTabBar (ctBar : TMBar.ButtonBar) {
            ctBar.layout.transitionStyle = .snap
            // 왼쪽 여백주기
            ctBar.layout.contentInset = UIEdgeInsets(top: 0.0, left: 20.0, bottom: 0.0, right: 20.0)
            
            // 간격
            ctBar.layout.interButtonSpacing = 40
                
            ctBar.backgroundView.style = .blur(style: .light)
            
            // 선택 / 안선택 색 + font size
            ctBar.buttons.customize {
                $0.tintColor = .systemGray2
                $0.selectedTintColor = .black
                $0.font = UIFont.systemFont(ofSize: 18)
                $0.selectedFont = UIFont.systemFont(ofSize: 18, weight: .bold)
            }
            
            // 인디케이터 (영상에서 주황색 아래 바 부분)
            ctBar.indicator.weight = .custom(value: 2)
            ctBar.indicator.tintColor = .black
        }
}
