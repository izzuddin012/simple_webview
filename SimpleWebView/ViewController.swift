//
//  ViewController.swift
//  SimpleWebView
//
//  Created by Muhammad Izzuddin on 19/12/18.
//  Copyright © 2018 Muhammad Izzuddin. All rights reserved.
//

import Foundation
import WebKit

class ViewController: UIViewController {

    fileprivate var webView: WKWebView = WKWebView()
    
    private let homeURLString: String = "https://lintaspoi.cloudappsolution.com/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshButton.image = UIImage(named: "refreshIcon")
        homeButton.image = UIImage(named: "homeIcon")
        
        let homeURL = URL(string:homeURLString)
        if let url = homeURL {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
}

extension ViewController: WKUIDelegate {
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
}

