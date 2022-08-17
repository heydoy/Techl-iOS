//
//  AllAlertViewController.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/17.
//

import UIKit

class AllAlertViewController: UIViewController {
    
    // MARK: - Properties
    static let identifier = "AllAlertViewController"
    
    @IBOutlet weak var tableView: UITableView!
    

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    // MARK: - Actions
    
    
    // MARK: - Helpers
    
    

 

}

extension AllAlertViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AlertTableViewCell.identifier, for: indexPath) as? AlertTableViewCell else { return UITableViewCell() }
        
        return cell
    }
}
