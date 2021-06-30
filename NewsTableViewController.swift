//
//  NewsTableViewController.swift
//  newsfeed
//
//  Created by Gleb Schelkunov on 28.06.2021.
//  Copyright © 2021 Gleb Schelkunov. All rights reserved.
//

import UIKit

var goURL: String!

class NewsTableViewController: UITableViewController {

    //MARK: - Свойства
    
    var items = [Item]()
    let url = URL(string: "https://newsapi.org/v2/top-headlines?sources=rt&apiKey=f316be219dd049828ddfbe0e5a523b64")
    var timer: Timer!
    
    //MARK: - Методы
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(refresh), userInfo: nil, repeats: true)
        loadNews()
    }
    
    @objc func refresh() {
        items = []
        loadNews()
        tableView.reloadData()
    }

    func loadNews() {
        let request = URLRequest(url: url!)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                print(error)
                return
            }
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: AnyObject]
                    if let articles = json["articles"] as? [[String: AnyObject]] {
                        //print(articles.count)
                        for article in articles {
                            let item = Item()
                            if let title = article["title"] as? String, let author = article["author"] as? String,
                                let url = article["url"] as? String, let urlToImage = article["urlToImage"] as? String {
                               // print(title)
                                item.title = title
                                item.author = author
                                item.url = url
                                item.urlToImage = urlToImage
                            }
                            self.items.append(item)
                        }
                        print(self.items.count)
                    }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch let err {
                    print(err)
                }
        }
        task.resume()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! NewsTableViewCell

        // Configure the cell...
        cell.label?.text = self.items[indexPath.row].title
        
        let data = try? Data(contentsOf: URL(string: self.items[indexPath.row].urlToImage!)!)
        cell.URLimageView?.image = UIImage(data: data!)
        
        return cell
    }
 
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.bounds.height/10
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        goURL = self.items[indexPath.row].url ?? "https://www.google.com"
        performSegue(withIdentifier: "goSegue", sender: nil)
    }

}
