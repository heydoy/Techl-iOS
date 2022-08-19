//
//  ForumPostViewController.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/09.
//

import UIKit

class ForumPostViewController: UIViewController {

    static let identifier = "ForumPostViewController"
    
    @IBOutlet weak var tableView: UITableView!
    
    var userText: String = ""
    
    @IBOutlet weak var userTextField: UITextField!
    
    @IBOutlet weak var sendReplyButton: UIButton!
    
    var forumIdx: Int = 0
    
    var forumArticle: ForumPost?
    
    var forumReplyList: [ForumReply] = []
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: PostArticleTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: PostArticleTableViewCell.identifier)
        
        tableView.register(UINib(nibName: PostReplyTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: PostReplyTableViewCell.identifier)

        configure()
        callRequest()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
        callRequest()
    }
    
    // MARK: - Actions
    func callRequest(){
        APIManager.shared.forumDetailRequest(forumIdx: self.forumIdx) { post in
            self.forumArticle = post
            
            self.tableView.reloadData()
        }
    }
  
    
    // MARK: - Helpers
    
    func configure() {
        userTextField.clearButtonMode = .whileEditing
        
    }
    
    // MARK: - Actions
    
    @IBAction func userTextFieldEditingChanged(_ sender: UITextField) {
        
        guard let text = sender.text else { return }
        
        userText = text
        
    }
    
    @IBAction func sendReplyButtonTapped(_ sender: UIButton) {
        
        if userText.isEmpty {

           self.view.makeToast("내용을 입력해주세요")
        } else {
            // 댓글 내용 추가하고 tableView.relooadData
            APIManager.shared.forumNewReplyRequest(content: userText) {
                self.view.makeToast("댓글을 입력하셨습니다")
                self.callRequest()
                
                self.userTextField.text = nil
                self.userText = ""
                
                
            }
           
            
        }

    }
}

// MARK: - TableView
extension ForumPostViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let forumArticle = self.forumArticle {
            return section == 0 ? 1 : forumArticle.getForumCommentRes.count
        }
        return section == 0 ? 1 : 0
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PostArticleTableViewCell.identifier, for: indexPath) as? PostArticleTableViewCell else { return UITableViewCell() }
            
            if let forumArticle = self.forumArticle {
                cell.configure(post: forumArticle)
                
            }
            return cell
            
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PostReplyTableViewCell.identifier, for: indexPath) as? PostReplyTableViewCell else { return UITableViewCell() }
            
            if let forumArticle = self.forumArticle {
                cell.configure(reply: forumArticle.getForumCommentRes[indexPath.row])
            }
            
            return cell
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}
