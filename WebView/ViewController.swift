//
//  ViewController.swift
//  WebView
//
//  Created by Muhammad Izzuddin on 19/12/18.
//  Copyright © 2018 Muhammad Izzuddin. All rights reserved.
//

import UIKit
import WebKit
import uiview_frame_helpers

class ViewController: UIViewController {

    private let homeURLString: String = "https://gigasel.cloudappsolution.com/webview/home"
    
    fileprivate var webView: WKWebView = WKWebView()
    
    
    private func setupWebView() {
        view.addSubview(webView)
        setWebViewPosition()
        reloadHomeURL()
    }
    
    private func setWebViewPosition() {
        webView.setSizeFrom(view.frame.size)
        if #available(iOS 11.0, *) {
            if let window: UIWindow = UIApplication.shared.keyWindow {
                webView.setH(webView.frame.height - window.safeAreaInsets.bottom)
            }
        }
        webView.insideLeftEdge(by: 0)
        webView.insideTopEdge(by: 0)
    }
    
    private func setupNavigation() {
        title = "GIGASEL"
        
        let barButton = UIBarButtonItem(
            image: UIImage(named: "ic_back"),
            style: UIBarButtonItem.Style.plain,
            target: self,
            action: #selector(didTapBack)
        )
        navigationItem.leftBarButtonItem = barButton
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = UIColor(red: 19.0 / 255.0, green: 24 / 255.0, blue: 27 / 255.0, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
        setupNavigation()
    }
    
    @objc func didTapBack() {
        webView.goBack()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(
            alongsideTransition: { _ in
                self.setWebViewPosition()
            },
            completion: { _ in
                self.setWebViewPosition()
            }
        )
    }
    
    @objc private func reloadHomeURL() {
        let homeURL = URL(string:homeURLString)
        if let url = homeURL {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    @objc private func reloadCurrentURL() {
        webView.reload()
    }
}


