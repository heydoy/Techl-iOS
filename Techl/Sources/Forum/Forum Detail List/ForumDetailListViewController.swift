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
    
    var forumList: [ForumArticle] = []
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        navigationItem.title = "이펙티브 자바"
        
        let item = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: nil)
        item.tintColor = UIColor.darkGray
        navigationItem.rightBarButtonItems = [ item ]
        setButtonconfigure()
        
        callRequest()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        callRequest()
    }
    
    func callRequest() {
        APIManager.shared.forumRequest { articles in
            self.forumList = articles
            self.collectionView.reloadData()
            
        }

    }

    @IBAction func forumWriteButtonTapped(_ sender: UIButton) {
        
        
        let storyboard = UIStoryboard(name: "Forum", bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: ForumEditorViewController.identifier) as! ForumEditorViewController
        
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)

    }
    
    // MARK: - Helper
    func setButtonconfigure() {
        forumWriteButton.layer.cornerRadius = forumWriteButton.frame.size.width/2
        forumWriteButton.backgroundColor = .CustomColor.primaryColor
    }

    
}

extension ForumDetailListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        forumList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ForumDetailListCollectionViewCell.identifier, for: indexPath) as? ForumDetailListCollectionViewCell else { return UICollectionViewCell() }
        
        cell.configure(post: forumList[indexPath.item])
        
        return cell
    }
    
    // 선택됐을 때 셀 이동
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 글 처리는 나중에
        let storyboard = UIStoryboard(name: "Forum", bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: ForumPostViewController.identifier) as! ForumPostViewController
        
        vc.forumIdx = forumList[indexPath.item].forumIdx
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
