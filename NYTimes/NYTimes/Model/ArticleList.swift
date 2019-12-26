//
//  ArticleListModel.swift
//  NYTimes
//
//  Created by MAYURI on 12/25/19.
//  Copyright © 2019 umesh. All rights reserved.
//

import Foundation


struct ArticleList {

    var title: String?
    var author: String?
    var publishedDate: String?
    var articleDetails: [[String: Any]]? = [[:]]
    
    init(articleList: [String: Any]) {
        title = articleList["title"] as? String
        author = articleList["byline"] as? String
        publishedDate = articleList["published_date"] as? String
        articleDetails = articleList["media"] as? [[String: Any]]
    }
}
