//
//  BookInfoViewController.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/02.
//

import UIKit
import Kingfisher

class BookInfoViewController: UIViewController {

    static let identifier = "BookInfoViewController"
    
    var booklist: [HomeBookModel] = []
    
    @IBOutlet weak var coverImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !booklist.isEmpty {
            configureData()
        }
    }
    
    func configureData() {
        titleLabel.text = booklist[0].title
        authorLabel.text = booklist[0].author
        
        let url = URL(string: booklist[0].cover)
        coverImageView.kf.setImage(with: url)
    }
    


}
