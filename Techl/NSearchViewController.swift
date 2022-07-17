//
//  NSearchViewController.swift
//  Techl
//
//  Created by Doy Kim on 2022/07/17.
//

import UIKit

class NSearchViewController: UIViewController {
    // MARK: - Properties
    
    
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    var resultList = [[String]]()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // 콜렉션 뷰 등록
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // MARK: - Actions
    
    // MARK: - Helpers


}

// MARK: - Extensions

extension NSearchViewController: UICollectionViewDataSource {

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NBookResultCell", for: indexPath) as? NBookResultCell else {
            return UICollectionViewCell()
        }
        //let result = resultList[indexPath.item]
        //cell.configure(result)
        
        return cell
    }

    
    // 해당 셀이 눌렸을 때
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 화면 띄우기
    }
    
    
}


extension NSearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let inset: CGFloat = 20
        let width: CGFloat = collectionView.bounds.width - (inset * 2)
        let height: CGFloat = 175
        
        return CGSize(width: width, height: height)
    }
}
