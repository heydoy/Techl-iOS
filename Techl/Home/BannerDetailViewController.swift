//
//  BannerDetailViewController.swift
//  Techl
//
//  Created by Doy Kim on 2022/07/31.
//

import UIKit
import WebKit

class BannerDetailViewController: UIViewController {
    
    // MARK: - Properties
    static let identifier = "BannerDetailViewController"

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    var destinationURL: String = ""
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        indicatorView.isHidden = true
        
        webView.navigationDelegate = self
        
        openWebpage(destinationURL)
        
    }
    
    // MARK: - Actions
    
    
    
    
    // MARK: - Helpers


}

extension BannerDetailViewController: WKNavigationDelegate {
    
    func openWebpage(_ url: String ) {
        guard let url = URL(string: url) else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        indicatorView.isHidden = false
        indicatorView.startAnimating()
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        indicatorView.stopAnimating()
        indicatorView.isHidden = true
    }
}
