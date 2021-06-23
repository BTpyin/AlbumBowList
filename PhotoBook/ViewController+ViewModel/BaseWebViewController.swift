//
//  BaseWebViewController.swift
//  PhotoBook
//
//  Created by Bowie Tso on 23/6/2021.
//

import UIKit
import WebKit

class BaseWebViewController: UIViewController {

    var url: String = "https://blank.page"
    var webviewTitle : String? = ""
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        // Do any additional setup after loading the view.
    }
    
    func initUI(){
        self.navigationItem.title = webviewTitle
        loadURL(urlString: url)
        view.backgroundColor = .white
    }
    
    
    func loadURL(urlString: String?) {
        
        
        guard let urlString = urlString,
        let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        
        webView.load(request)
    }

}
