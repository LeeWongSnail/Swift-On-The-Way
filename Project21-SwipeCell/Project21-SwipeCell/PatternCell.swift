//
//  PatternCell.swift
//  Project21-SwipeCell
//
//  Created by LeeWong on 16/3/2.
//  Copyright © 2016年 LeeWong. All rights reserved.
//

import UIKit


struct pattern {
    let image : String
    let name : String
}


class PatternCell: UITableViewCell {

    
    @IBOutlet weak var iconImage: UIImageView!
    
  
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
