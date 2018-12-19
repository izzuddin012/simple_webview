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

    private let homeURLString: String = "https://lintaspoi.cloudappsolution.com/"
    
    fileprivate var webView: FullScreenWKWebView = FullScreenWKWebView()
    fileprivate lazy var refreshButton: UIImageView = createRefreshButton()
    fileprivate lazy var homeButton: UIImageView = createHomeButton()
    fileprivate lazy var contactMeLabel: UILabel = UILabel()
    
    private func createRefreshButton() -> UIImageView {
        let imageView = UIImageView()
        imageView.setW(48, andH: 48)
        imageView.image = UIImage(named: "refresh_icon")
        return imageView
    }
    
    private func createHomeButton() -> UIImageView {
        let imageView = UIImageView()
        imageView.setW(48, andH: 48)
        imageView.image = UIImage(named: "home_icon")
        return imageView
    }
    
    private func setupContactMeLabel() {
        view.addSubview(contactMeLabel)
        contactMeLabel.text = "Suggestion? Text Me 0811343434"
        contactMeLabel.textColor = .black
        contactMeLabel.font = UIFont(name: "HelveticaNeue", size: 12)!
        contactMeLabel.backgroundColor = UIColor(
            red: 255, green: 255, blue: 255, alpha: 0.5
        )
        contactMeLabel.textAlignment = .center
        contactMeLabel.layer.cornerRadius = 8
        contactMeLabel.clipsToBounds = true
        contactMeLabel.setW(200, andH: 24)
        contactMeLabel.insideTopEdge(by: 24)
        contactMeLabel.insideLeftEdge(by: 24)
    }
    
    private func setupRefreshButton() {
        view.addSubview(refreshButton)
        setRefreshButtonPosition()
        let gestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(reloadCurrentURL)
        )
        refreshButton.addGestureRecognizer(gestureRecognizer)
        refreshButton.isUserInteractionEnabled = true
    }
    
    private func setupHomeButton() {
        view.addSubview(homeButton)
        setHomeButtonPosition()
        let gestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(reloadHomeURL)
        )
        homeButton.addGestureRecognizer(gestureRecognizer)
        homeButton.isUserInteractionEnabled = true
    }
    
    private func setupWebView() {
        view.addSubview(webView)
        setWebViewPosition()
        reloadHomeURL()
    }
    
    private func setWebViewPosition() {
        webView.setSizeFrom(view.frame.size)
        webView.insideLeftEdge(by: 0)
        webView.insideTopEdge(by: 0)
    }
    
    private func setHomeButtonPosition() {
        homeButton.insideRightEdge(by: 36)
        homeButton.insideBottomEdge(by: 24)
    }
    
    private func setRefreshButtonPosition() {
        refreshButton.insideRightEdge(by: 36)
        refreshButton.outsideTopEdge(of: homeButton, by: 8)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
        setupHomeButton()
        setupRefreshButton()
        setupContactMeLabel()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(
            alongsideTransition: { _ in
                self.setWebViewPosition()
                self.setHomeButtonPosition()
                self.setRefreshButtonPosition()
            },
            completion: { _ in
                self.setWebViewPosition()
                self.setHomeButtonPosition()
                self.setRefreshButtonPosition()
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


