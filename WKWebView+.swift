//
//  WKWebView+.swift
//  newsfeed
//
//  Created by Gleb Schelkunov on 30.06.2021.
//  Copyright © 2021 Gleb Schelkunov. All rights reserved.
//

import Foundation
import  WebKit

extension WKWebView {
    
    func search(adress: String) {
        if let url = URL(string: adress) {
            let request = URLRequest(url: url)
            self.load(request)
        }
    }
    
}
