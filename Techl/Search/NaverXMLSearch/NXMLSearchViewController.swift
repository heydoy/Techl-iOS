//
//  NXMLSearchViewController.swift
//  Techl
//
//  Created by Doy Kim on 2022/07/26.
//

import UIKit

class NXMLSearchViewController: UIViewController {
    
    static let identifier = "NXMLSearchViewController"

    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "책 검색"
        

        collectionView.dataSource = self
        collectionView.delegate = self
    }
    

}

extension NXMLSearchViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NXMLSearchCollectionViewCell.identifier, for: indexPath) as? NXMLSearchCollectionViewCell else { return UICollectionViewCell()}
        
        return cell
    }
    
    
    
    
}
