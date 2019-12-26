//
//  ArticleListTableViewCell.swift
//  NYTimes
//
//  Created by MAYURI on 12/25/19.
//  Copyright © 2019 umesh. All rights reserved.
//

import UIKit

class ArticleListTableViewCell: UITableViewCell {
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var dotView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        dotView.layer.cornerRadius = dotView.frame.size.width/2
        dotView.clipsToBounds = true
    }

}
