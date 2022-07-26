//
//  ForumViewController.swift
//  Techl
//
//  Created by Doy Kim on 2022/07/25.
//

import UIKit

class ForumViewController: UIViewController {

    @IBOutlet weak var forumListCollectionView: UICollectionView!
    
    @IBOutlet weak var writeForumButton: UIButton!
    
    
    static let identifier = "ForumViewController"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "클린코드"
        
        
        forumListCollectionView.dataSource = self
        forumListCollectionView.delegate = self
        
        configure()

    }
    
    func configure() {
        writeForumButton.layer.cornerRadius = writeForumButton.frame.width/2
        
    }
}


extension ForumViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = forumListCollectionView.dequeueReusableCell(withReuseIdentifier: ForumListCollectionViewCell.identifier, for: indexPath) as? ForumListCollectionViewCell else { return UICollectionViewCell()}
        
        cell.configure()
        
        return cell
    }
}
