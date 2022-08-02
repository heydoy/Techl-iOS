//
//  ForumDetailListViewController.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/02.
//

import UIKit

import Toast

class ForumDetailListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var forumWriteButton: UIButton!
    
    static let identifier = "ForumDetailListViewController"
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        navigationItem.title = "클린코드"
        
        let item = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: nil)
        item.tintColor = UIColor.darkGray
        navigationItem.rightBarButtonItems = [ item ]
        setButtonconfigure()

    }

    @IBAction func forumWriteButtonTapped(_ sender: UIButton) {
        self.view.makeToast("포럼 글쓰기를 클릭")

    }
    
    // MARK: - Helper
    func setButtonconfigure() {
        forumWriteButton.layer.cornerRadius = forumWriteButton.frame.size.width/2
        forumWriteButton.backgroundColor = .CustomColor.primaryColor
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
