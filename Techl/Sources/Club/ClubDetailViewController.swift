//
//  ClubDetailViewController.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/24.
//

import UIKit
import Toast

class ClubDetailViewController: UIViewController {
    // MARK: - Prooperties
    static let identifier = "ClubDetailViewController"

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var applyClubButton: UIButton!
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: ClubDetailHeadTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ClubDetailHeadTableViewCell.identifier)
        
        tableView.register(UINib(nibName: ClubDetailBodyTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ClubDetailBodyTableViewCell.identifier)
        
        configureUI()
    }
    
    func configureUI() {
        
        applyClubButton.layer.cornerRadius = 8
        favoriteButton.layer.cornerRadius = 8
    }
    
    // MARK: - Actions
    @IBAction func favoriteButtonTapped(_ sender: UIButton) {
        
        favoriteButton.isSelected = !favoriteButton.isSelected
        
        if favoriteButton.isSelected {
            self.view.makeToast("즐겨찾기 완료")
            
            favoriteButton.backgroundColor = .CustomColor.secondaryColor
            
            
        } else {
            self.view.makeToast("즐겨찾기를 취소하였습니다")
            favoriteButton.backgroundColor = .systemGray5
        }
    }
    
    
    @IBAction func bookclubButtonTapped(_ sender: UIButton) {
        
        applyClubButton.isSelected = !applyClubButton.isSelected
        
        applyClubButton.titleLabel?.font = .boldSystemFont(ofSize: 15)
        
        if applyClubButton.isSelected {
            self.view.makeToast("북클럽을 신청하였습니다")
            applyClubButton.setTitle("북클럽 신청완료", for: .normal)
            applyClubButton.backgroundColor = .systemGray3
        } else {
            self.view.makeToast("북클럽 신청을 취소하였습니다")
            applyClubButton.setTitle("북클럽 신청하기", for: .normal)
            applyClubButton.backgroundColor = .CustomColor.primaryColor
        }
        
    }
    
    


}

extension ClubDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 { return 1 }
        else if section == 1 { return 2 }
        else { return 0 }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ClubDetailHeadTableViewCell.identifier, for: indexPath) as? ClubDetailHeadTableViewCell else { return UITableViewCell() }
            return cell
            
        } else if indexPath.section == 1 {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ClubDetailBodyTableViewCell.identifier, for: indexPath) as? ClubDetailBodyTableViewCell else { return UITableViewCell() }
            
            return cell
            
        } else {
            return UITableViewCell() 
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
