//
//  BaseWebViewController.swift
//  AlbumBowList
//
//  Created by Bowie Tso on 23/6/2021.
//

import UIKit
import RxSwift
import WebKit

class BaseWebViewController: BaseViewController, WKNavigationDelegate, WKUIDelegate {

    var url: String = "https://blank.page"
    var webviewTitle : String? = ""
    
    @IBOutlet weak var webView: WKWebView!
    var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        webView.uiDelegate = self
        initUI()
        // Do any additional setup after loading the view.
    }
    
    func initUI(){
        self.navigationItem.title = webviewTitle
        loadURL(urlString: url)
        view.backgroundColor = .white
        activityIndicator = UIActivityIndicatorView()
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.medium
        view.addSubview(activityIndicator)
    }
    
    func showActivityIndicator(show: Bool) {
        if show {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
    
    func loadURL(urlString: String?) {
        
        guard let urlString = urlString,
        let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        
        webView.load(request)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
         showActivityIndicator(show: false)
     }

     func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
         showActivityIndicator(show: true)
     }

     func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
         showActivityIndicator(show: false)
        self.showAlert(error.localizedDescription)
     }

}
