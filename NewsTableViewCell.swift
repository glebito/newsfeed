//
//  NewsTableViewCell.swift
//  newsfeed
//
//  Created by Gleb Schelkunov on 28.06.2021.
//  Copyright © 2021 Gleb Schelkunov. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    var label: UILabel!
    var URLimageView: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let labelFrame = CGRect(x: self.frame.width*0.45, y: self.frame.height*0.1, width: self.frame.width*0.8, height: self.frame.height*1.8)
        self.label = UILabel(frame: labelFrame)
        self.label.numberOfLines = 0
        
        let imageFrame = CGRect(x: self.frame.width*0.01, y: self.frame.height*0.1, width: self.frame.width*0.4, height: self.frame.height*1.8)
        self.URLimageView = UIImageView(frame: imageFrame)
        self.URLimageView.clipsToBounds = true
        self.URLimageView.layer.cornerRadius = 8
        
        self.addSubview(self.label)
        self.addSubview(self.URLimageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
