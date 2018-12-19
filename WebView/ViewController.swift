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

    fileprivate var webView: WKWebView = WKWebView()
    fileprivate lazy var refreshButton: UIImageView = createRefreshButton()
    fileprivate lazy var homeButton: UIImageView = createHomeButton()
    
    private func createRefreshButton() -> UIImageView {
        let imageView = UIImageView()
        imageView.setW(64, andH: 64)
        imageView.image = UIImage(named: "refresh_icon")
        return imageView
    }
    
    private func createHomeButton() -> UIImageView {
        let imageView = UIImageView()
        imageView.setW(64, andH: 64)
        imageView.image = UIImage(named: "home_icon")
        return imageView
    }
    
    private func setupRefreshButton() {
        view.addSubview(refreshButton)
        refreshButton.insideRightEdge(by: 24)
        refreshButton.outsideTopEdge(of: homeButton, by: 16)
    }
    
    private func setupHomeButton() {
        view.addSubview(homeButton)
        homeButton.insideRightEdge(by: 24)
        homeButton.insideBottomEdge(by: 24)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHomeButton()
        setupRefreshButton()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(
            alongsideTransition: { _ in
                self.setupHomeButton()
                self.setupRefreshButton()
            },
            completion: { _ in
                self.setupHomeButton()
                self.setupRefreshButton()
            }
        )
    }
}



