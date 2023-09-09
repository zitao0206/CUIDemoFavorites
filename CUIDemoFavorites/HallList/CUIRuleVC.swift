//
//  CUIRuleVC.swift
//  CUIDemoFavorites
//
//  Created by zitao0206 on 2023/9/9.
//  Copyright © 2023 zitao0206. All rights reserved.
//

import Foundation
import UIKit
import WebKit

@objc(CUIRuleVC)
@objcMembers
class CUIRuleVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ReadMe"
        self.view.addSubview(self.webView)
        self.view.backgroundColor = UIColor.white
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.webView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
    }

    lazy private var webView: WKWebView = {
      
        let conf = WKWebViewConfiguration()
        conf.preferences = WKPreferences()
        conf.preferences.minimumFontSize = 10
        let webView = WKWebView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), configuration: conf)
        webView.load(URLRequest(url: URL(string: "https://github.com/zitao0206/CUIDemoFavorites/")!))
 
        return webView
    }()
}
