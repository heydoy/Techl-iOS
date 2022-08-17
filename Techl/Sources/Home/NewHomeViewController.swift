//
//  NewHomeViewController.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/16.
//

import UIKit

class NewHomeViewController: UIViewController {
    // MARK: - Properties
    static let identifier = "NewHomeViewController"
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        designUI()
        configureNavigation()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        
    }
    
    // MARK: - Actions
    
    
    // MARK: - Helpers
    func designUI() {
        self.view.backgroundColor = .systemGray6
        
    }
    
    func configureNavigation() {
        let searchButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(searchButtonTapped))
        
        let alertButton = UIBarButtonItem(image: UIImage(systemName: "bell"), style: .plain, target: self, action: #selector(alertButtonTapped))
        
        searchButton.tintColor = .black
        alertButton.tintColor = .black
        
        navigationItem.rightBarButtonItems = [alertButton, searchButton]
        
        setBackButton(.CustomColor.secondaryColor)
        
    }
    
    @objc
    func searchButtonTapped(_ sender: UIBarButtonItem) {
        
        let sb = UIStoryboard(name: "Search", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: NXMLSearchViewController.identifier) as! NXMLSearchViewController

        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc
    func alertButtonTapped(_ sender: UIBarButtonItem) {
        let sb = UIStoryboard(name: "Alert", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: AlertContainerViewController.identifier) as! AlertContainerViewController
        
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
}

// MARK: - TableView Delegate, Datasource

extension NewHomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 셀 3개안의 콜렉션 뷰를 모두 이 VC에서 위임해야한다.
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BannerTableViewCell.identifier, for: indexPath) as? BannerTableViewCell else { return UITableViewCell() }
            cell.selectionStyle = .none
            
            // 콜렉션 뷰 위임
            cell.bannerContentCollectionView.delegate = self
            cell.bannerContentCollectionView.dataSource = self
            
            cell.bannerContentCollectionView.tag = indexPath.row
            
            // 반환
            return cell
            
        } else if indexPath.row == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ClubTableViewCell.identifier, for: indexPath) as? ClubTableViewCell else { return UITableViewCell()  }
            cell.selectionStyle = .none
            
            // 콜렉션 뷰 위임
            cell.clubContentCollectionView.delegate = self
            cell.clubContentCollectionView.dataSource = self
            
            
            cell.clubContentCollectionView.tag = indexPath.row
            
            //반환
            return cell
            
        } else if indexPath.row == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ForumTableViewCell.identifier, for: indexPath) as? ForumTableViewCell else { return UITableViewCell() }
            cell.selectionStyle = .none
            
            // 콜렉션 뷰 위임
            cell.forumContentCollectionView.delegate = self
            cell.forumContentCollectionView.dataSource = self
            
            cell.forumContentCollectionView.tag = indexPath.row
            // 반환
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 { return 120 }
        else if indexPath.row == 1 { return 240+72+10}
        else {
            let height: CGFloat = 140
            let number: CGFloat = 5
            let margin: CGFloat = 12
            return (height+margin) * number + 92
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return  0
    }
}

// MARK: - CollectionView Delegate, Datasource, FlowLayout

extension NewHomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView.tag == 0 {
            return 3
        } else if collectionView.tag == 1 {
            //클럽갯수만큼 반환
            print("두번째섹션")
            return 10
        } else if collectionView.tag == 2 {
            // 북카드 갯수만큼 반환
            return 5
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 0 {
            // 배너
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.identifier, for: indexPath) as? BannerCollectionViewCell else { return UICollectionViewCell() }
            
            return cell
            
        } else if collectionView.tag == 1 {
            //클럽
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ClubCollectionViewCell.identifier, for: indexPath) as? ClubCollectionViewCell else { return UICollectionViewCell() }
            
            
            return cell
            
        } else if collectionView.tag == 2 {
            // 북카드
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookCardCollectionViewCell.identifier, for: indexPath) as? BookCardCollectionViewCell else { return UICollectionViewCell() }
            return cell
        } else {
            return UICollectionViewCell()
        }
        
    }
    
}

