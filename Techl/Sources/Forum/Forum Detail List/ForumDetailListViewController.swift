//
//  ForumDetailListViewController.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/02.
//

import UIKit

class ForumDetailListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    static let identifier = "ForumDetailListViewController"
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        navigationItem.title = "클린코드"

    }


}

extension ForumDetailListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ForumDetailListCollectionViewCell.identifier, for: indexPath) as? ForumDetailListCollectionViewCell else { return UICollectionViewCell() }
        
        cell.configure()
        
        return cell
    }
    
}
