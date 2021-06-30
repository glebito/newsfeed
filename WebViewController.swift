//
//  WebViewController.swift
//  newsfeed
//
//  Created by Gleb Schelkunov on 30.06.2021.
//  Copyright © 2021 Gleb Schelkunov. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        webView = WKWebView(frame: self.view.frame)
        self.view.addSubview(webView)
        webView.search(adress: goURL)
    }
    
    @objc func goBack() {
        performSegue(withIdentifier: "goBack", sender: nil)
    }

}
