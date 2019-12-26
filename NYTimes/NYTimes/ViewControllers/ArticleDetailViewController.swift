//
//  ArticleDetailViewController.swift
//  NYTimes
//
//  Created by MAYURI on 12/26/19.
//  Copyright © 2019 umesh. All rights reserved.
//

import UIKit

class ArticleDetailViewController: UIViewController {

    var articleDetail: [String: Any] = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(articleDetail)

    }
    

    @IBAction func backItemPressed(_ sender: Any) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
}
