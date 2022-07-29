//
//  NXMLSearchCollectionReusableView.swift
//  Techl
//
//  Created by Doy Kim on 2022/07/28.
//

import UIKit

class NXMLSearchCollectionReusableView: UICollectionReusableView {
    static  let identifier = "NXMLSearchCollectionReusableView"
    
    @IBOutlet weak var searchResultLabel: UILabel!
    
    @IBOutlet weak var searchFilterButton: UIButton!
    
    func configure(query: String, total: Int  ) {
        
        searchResultLabel.text = "\(query) 검색결과 \(57)건"
    }
    
    @IBAction func searchFilterButtonTapped(_ sender: UIButton) {
        
    }
    
        
}
