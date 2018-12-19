//
//  FullScreenWebView.swift
//  WebView
//
//  Created by Muhammad Izzuddin on 19/12/18.
//  Copyright © 2018 Muhammad Izzuddin. All rights reserved.
//

import Foundation
import WebKit

class FullScreenWKWebView: WKWebView {
    override var safeAreaInsets: UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
