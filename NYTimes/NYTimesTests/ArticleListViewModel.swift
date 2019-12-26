//
//  ArticleListViewModelTest.swift
//  NYTimesTests
//
//  Created by MAYURI on 12/26/19.
//  Copyright © 2019 umesh. All rights reserved.
//

import XCTest
@testable import NYTimes

class ArticleListViewModelTest: XCTestCase {

    var testArticleViewModel: ArticleListViewModel!
    override func setUp() {
        
        testArticleViewModel = ArticleListViewModel()
    }

    override func tearDown() {
        testArticleViewModel = nil
    }

    
    func testGetRequest() {
       
    }
}
