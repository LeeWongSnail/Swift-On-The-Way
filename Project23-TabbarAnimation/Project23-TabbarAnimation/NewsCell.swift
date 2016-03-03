//
//  NewsCell.swift
//  Project23-TabbarAnimation
//
//  Created by LeeWong on 16/3/3.
//  Copyright © 2016年 LeeWong. All rights reserved.
//

import UIKit

struct news {
    let iconImage : String
    let nickName : String
    let newImage : String
    let tagText : String
    let newsTitle : String
    let newsTime : String
    let newsSource : String
}

class NewsCell: UITableViewCell {

    @IBOutlet weak var iconImageV: UIImageView!
    
    @IBOutlet weak var nickNameLabel: UILabel!
    
    @IBOutlet weak var newsImageV: UIImageView!
    
    @IBOutlet weak var tagLabel: UILabel!
    
    @IBOutlet weak var newsTitleLabel: UILabel!
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var newSourceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
