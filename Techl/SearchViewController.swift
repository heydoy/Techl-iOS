//
//  SearchViewController.swift
//  Techl
//
//  Created by Doy Kim on 2022/07/10.
//

import UIKit
import Alamofire

class SearchViewController: UIViewController {

    var query: String = ""
    
    @IBOutlet weak var searchQuery: UITextField!
    
    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var resultTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func queryEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        
        self.query = text
        
        
    }
    
    @IBAction func didButtonTapped(_ sender: UIButton) {
        searchHelper(self.query)
        
    }
    
    
    func searchHelper(_ query: String) {
        
    }


}
