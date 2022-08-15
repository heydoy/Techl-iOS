//
//  ProfileSelectionViewController.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/15.
//

import UIKit

class ProfileSelectionViewController: UIViewController {
    // MARK: - Properties
    static let identifier = "ProfileSelectionViewController"
    var delegate: ModalDelegate? 
    
    let imageArray: [String] = [
        "profile-1", "profile-2",
        "profile-3", "profile-4",
        "profile-5", "profile-6",
        "profile-7", "profile-8",
        "profile-9", "profile-10"
    ]
    
    var selectedImage = ""
    
    @IBOutlet weak var baseView: UIView!
    
    @IBOutlet weak var finishButton: UIButton!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    // MARK: - Lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        designUI()

    }
    
    // MARK: - Actions
    @IBAction func dismissButtonTapped(_ sender: UIButton) {
        
        self.dismiss(animated: true)
    }
    
    
    @IBAction func finishButtonTapped(_ sender: UIButton) {
        if let delegate = self.delegate {
            delegate.changeImage(self.selectedImage)
        }
        dismiss(animated: true)
       
    }
    
    
    // MARK: - Helpers
    
    func designUI() {
        baseView.layer.cornerRadius = 8
        finishButton.layer.cornerRadius = 8
    }


}

extension ProfileSelectionViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileSelectionCollectionViewCell.identifier, for: indexPath) as? ProfileSelectionCollectionViewCell else { return UICollectionViewCell() }
        
        let isChecked = imageArray[indexPath.item] == selectedImage ? true : false
        cell.configure(imageName: imageArray[indexPath.item], isChecked: isChecked)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let number: CGFloat = 5
        
        let margin: CGFloat = 8 * ( number - 1 )
        
        let viewSize = collectionView.bounds.width - margin
        
        let width: CGFloat = viewSize / number
        
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.selectedImage = imageArray[indexPath.item]
        collectionView.reloadData()
    }
    
}

// MARK: - CollectionViewCell

class ProfileSelectionCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ProfileSelectionCollectionViewCell"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var isCheckedImageView: UIImageView!
    
    
    func configure(imageName: String, isChecked: Bool) {
        
        imageView.image = UIImage(named: imageName)
        
        isCheckedImageView.isHidden = isChecked ? false : true
    }

}
