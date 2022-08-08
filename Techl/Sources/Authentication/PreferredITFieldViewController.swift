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
    
    let tagHeaderArray: [String] = [
        "디자인패턴", "프로그래밍언어"
    ]
    let ITFieldTagArray: [[String]] = [
        ["디자인패턴", "네트워크", "UI/UX", "HCI"],
        ["자바", "알고리즘", "고양이"]
    ]
    
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
        
        let cell = UINib(nibName: TagCollectionViewCell.identifier, bundle: nil)
        collectionView.register(cell , forCellWithReuseIdentifier: TagCollectionViewCell.identifier)
    }
    
    // MARK: - Actions
    
    // MARK: - Helpers
    

   

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
        
        cell.toggleTag(didTagClicked)
        cell.labelDesign(ITFieldTagArray[indexPath.section][indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        didTagClicked = !didTagClicked
        
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //return TagCollectionViewCell.fittingSize(availableHeight: 50)
        let width: CGFloat = ITFieldTagArray[indexPath.section][indexPath.item].size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16)]).width + 25
        let height: CGFloat = 45
        
        return CGSize(width: width, height: height)
    }

    
    
}
