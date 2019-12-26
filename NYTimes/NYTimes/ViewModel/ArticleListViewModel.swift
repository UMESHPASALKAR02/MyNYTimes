//
//  NetworkService.swift
//  NYTimes
//
//  Created by MAYURI on 12/25/19.
//  Copyright © 2019 umesh. All rights reserved.
//

import Foundation
import Alamofire

class ArticleListViewModel {
    
    func getRequest(searchId: String, completion: @escaping ([ArticleList]) -> Void)  {
            let API_KEY: String = "5L5Y0fLntpKHxalg6UldhUGmpvhrcpIc"
            let urlString = "https://api.nytimes.com/svc/mostpopular/v2/viewed/\(searchId).json?api-key=\(API_KEY)"
            
            AF.request(urlString).responseJSON { response in
                guard response.error == nil else {
                    print(response.error!)
                    return
                }
                
                guard let json = response.value as? [String: Any] else {
                    if let error = response.error {
                    print("Error: \(error)")
                 }
                 return
               }
                
                var article: [ArticleList] = []
            
                if let result = json["results"] as? [[String: Any]] {
                    for anArticle in result {
                        let anArticle = ArticleList(articleList: anArticle)
                        article.append(anArticle)
                    }
            
                }
            completion(article)
        }
    }
}



