//
//  ViewController.swift
//  NYTimes
//
//  Created by MAYURI on 12/25/19.
//  Copyright © 2019 umesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var articleListTableView: UITableView!
    
    var resultSearchController = UISearchController()
    lazy var articleSearchBar: UISearchBar = UISearchBar()
    
    var articleList: [ArticleList] = []
    let articleListViewModel = ArticleListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                articleListViewModel.getRequest(searchId: "1") {[weak self] (article) in
                    print(article)
                    self?.articleList = article
                        DispatchQueue.main.async {
                            self?.articleListTableView.reloadData()
                    }
        }
    }
    
    @IBAction func searchButtonClicked(_ sender: Any) {
        
        self.articleSearchBar.searchBarStyle = UISearchBar.Style.prominent
        self.articleSearchBar.placeholder = " Search"
        self.articleSearchBar.sizeToFit()
        self.articleSearchBar.isTranslucent = false
        
        self.articleSearchBar.showsCancelButton = true

        self.articleSearchBar.delegate = self as UISearchBarDelegate
        self.titleView.addSubview(self.articleSearchBar)
        articleListTableView.reloadData()
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate,  UISearchBarDelegate{
    
    // MARK: Search article operations
   
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.articleList.removeAll(keepingCapacity: false)
        
        articleListViewModel.getRequest(searchId: self.articleSearchBar.text!) {[weak self] (article) in
            print(article)
            self?.articleList = article
            DispatchQueue.main.async {
                self?.articleListTableView.reloadData()
                
            }
        }
        self.articleSearchBar.removeFromSuperview()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.articleSearchBar.removeFromSuperview()
    }
    
    // MARK: Tableview methods
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 134.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ArticleListTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "ArticleCell") as? ArticleListTableViewCell)!
        
        let anArticle = self.articleList[indexPath.row]
        
        cell.articleTitle.text = anArticle.title
        cell.author.text = anArticle.author
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let detailArticle = storyboard.instantiateViewController(withIdentifier: "ArticleDetailViewController") as! ArticleDetailViewController
        
        let anArticle = self.articleList[indexPath.row]
        
        if let result = anArticle.articleDetails {
                for detail in result {
                    detailArticle.articleDetail = detail 
                }
        
            }
        
        navigationController?.pushViewController(detailArticle, animated: true)
    }
    
}

