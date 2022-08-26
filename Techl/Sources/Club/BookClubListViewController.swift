//
//  BookClubListViewController.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/02.
//

import UIKit

class BookClubListViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var myClubCollectionView: UICollectionView!
    
    @IBOutlet weak var otherClubCollectionView: UICollectionView!
    
    @IBOutlet weak var makeClubButton: UIButton!
    
    var clubList: [ClubModel] = ClubModel.list
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeClubButton.layer.cornerRadius = makeClubButton.frame.width/2
        
        // 콜렉션 뷰 등록
        myClubCollectionView.dataSource = self
        myClubCollectionView.delegate = self
        
        otherClubCollectionView.delegate = self
        otherClubCollectionView.delegate = self
        
        
        // 셀 등록
        
        myClubCollectionView.register(UINib(nibName: String(describing: BookClubCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: BookClubCollectionViewCell.self))
        
        otherClubCollectionView.register(UINib(nibName: String(describing: BookClubCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: BookClubCollectionViewCell.self))

    }
    
    // MARK: - Actions
    
    @IBAction func addNewClubButtonTapped(_ sender: UIButton) {
        
        let sb = UIStoryboard(name: "Club", bundle: nil)
        
        let vc = sb.instantiateViewController(withIdentifier: AddNewClubViewController.identifier) as! AddNewClubViewController
        
        vc.modalPresentationStyle = .overFullScreen
                
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    // MARK: -  Helpers



}

extension BookClubListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case myClubCollectionView:
            return 4
        case otherClubCollectionView:
            return 8
        default:
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case myClubCollectionView:
            guard let cell = myClubCollectionView.dequeueReusableCell(withReuseIdentifier: BookClubCollectionViewCell.identifier, for: indexPath) as? BookClubCollectionViewCell else { return UICollectionViewCell()}
            return cell
                    
        case otherClubCollectionView:
            guard let cell = otherClubCollectionView.dequeueReusableCell(withReuseIdentifier: BookClubCollectionViewCell.identifier, for: indexPath) as? BookClubCollectionViewCell else { return UICollectionViewCell()}
                    
            return cell
                        
            default:
                print("wrong")
                return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == myClubCollectionView {
            
            let sb = UIStoryboard(name: "Club", bundle: nil)
            
            let vc = sb.instantiateViewController(withIdentifier: "ClubDetailViewController")
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    
}
