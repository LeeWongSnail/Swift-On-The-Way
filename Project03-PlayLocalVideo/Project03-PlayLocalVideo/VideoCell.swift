//
//  VideoCell.swift
//  Project03-PlayLocalVideo
//
//  Created by LeeWong on 16/2/22.
//  Copyright © 2016年 LeeWong. All rights reserved.
//

import UIKit

protocol VideoCellPlayBtnDidClick : class {
    func playBtnDidClick(cell:VideoCell)
}

class VideoCell: UITableViewCell {

    @IBOutlet weak var videoBg: UIImageView!
    
    weak var delegate : VideoCellPlayBtnDidClick?
    
    @IBAction func videoPlayDidClick(sender: AnyObject) {
        
        if (delegate != nil) {
            delegate?.playBtnDidClick(self)
        }
     
        
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
