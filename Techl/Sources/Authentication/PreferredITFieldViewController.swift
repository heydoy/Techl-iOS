//
//  PreferredITFieldViewController.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/07.
//

import UIKit

class PreferredITFieldViewController: UIViewController {
    static let identifier = "PreferredITFieldViewController"
    // MARK: - Properties
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    @IBOutlet weak var finishButton: UIButton!
    
    let tagHeaderArray: [String] = [
        "디자인패턴", "프로그래밍언어"
    ]
    
    let ITFieldTagArray: [[String]] = [
        ["디자인패턴", "네트워크", "UI/UX", "HCI"],
        ["자바", "알고리즘", "고양이"]
    ]
    
    var arrSelectedIndex = [IndexPath]()
    var arrSelectedData = [String]() {
        didSet {
            designButtonUI()
        }
    }
    
    
    var didTagClicked: Bool = false {
        didSet {
            collectionView.reloadData()
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.allowsMultipleSelection = true
        
        let cell = UINib(nibName: TagCollectionViewCell.identifier, bundle: nil)
        collectionView.register(cell , forCellWithReuseIdentifier: TagCollectionViewCell.identifier)
        
        designButtonUI()

    }
    
    // MARK: - Actions
    
    @IBAction func finishButtonTapped(_ sender: UIButton) {
        // 📌 완료 버튼 누르면 arrSelectedData userinfo로 보내주고, 서버통신
        
        
        // 메인 탭바 화면으로 이동 --> 첫 화면을 바꾸기 (히스토리 날리기)
        
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
                
        // 생명주기 관리하는 SceneDelegate 전체
        let sceneDelegate = windowScene?.delegate as? SceneDelegate
        
        // 시작해서 보여줄 화면
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: MainTabBarViewController.identifier) as! MainTabBarViewController
        
        
        sceneDelegate?.window?.rootViewController = vc
        sceneDelegate?.window?.makeKeyAndVisible()
        
    }
    
    
    // MARK: - Helpers
    func designButtonUI() {
        finishButton.layer.cornerRadius = 8
        if arrSelectedData.count > 0 {
            
            finishButton.isEnabled = true
            finishButton.backgroundColor = .CustomColor.primaryColor
            
        } else {
            finishButton.isEnabled = false
            finishButton.backgroundColor = .CustomColor.disabledButtonColor
            
        }
    }

   

}

extension PreferredITFieldViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return ITFieldTagArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: TagCollectionHeader.identifier, for: indexPath) as? TagCollectionHeader else { return UICollectionReusableView() }
        
        sectionHeader.sectionHeaderLabel.text = tagHeaderArray[indexPath.section]
        return sectionHeader
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ITFieldTagArray[section].count
    }
    

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCollectionViewCell.identifier, for: indexPath) as? TagCollectionViewCell else { return UICollectionViewCell() }
        
        cell.labelDesign(ITFieldTagArray[indexPath.section][indexPath.item])
        
        if arrSelectedIndex.contains(indexPath) {
            cell.pressedConfigure()
        } else {
            cell.configure()
        }
                

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let strData = ITFieldTagArray[indexPath.section][indexPath.item]

        if arrSelectedIndex.contains(indexPath) {
            arrSelectedIndex = arrSelectedIndex.filter { $0 != indexPath}
            arrSelectedData = arrSelectedData.filter { $0 != strData}
        }
        else {
            arrSelectedIndex.append(indexPath)
            arrSelectedData.append(strData)
        }

        print(#function, arrSelectedData, arrSelectedIndex)
        collectionView.reloadData()
        
        
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //return TagCollectionViewCell.fittingSize(availableHeight: 50)
        let width: CGFloat = ITFieldTagArray[indexPath.section][indexPath.item].size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16)]).width + 25
        let height: CGFloat = 45
        
        return CGSize(width: width, height: height)
    }

    
    
}
