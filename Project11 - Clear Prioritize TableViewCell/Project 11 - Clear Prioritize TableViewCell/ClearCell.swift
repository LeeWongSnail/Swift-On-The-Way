//
//  ClearCell.swift
//  Project 11 - Clear Prioritize TableViewCell
//
//  Created by LeeWong on 16/2/25.
//  Copyright © 2016年 LeeWong. All rights reserved.
//

import UIKit

class ClearCell: UITableViewCell {

    private var gradientLayer = CAGradientLayer()
    

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        gradientLayer.frame = self.bounds
        
        let color1 = UIColor(white: 1.0, alpha: 0.2).CGColor as CGColorRef
        let color2 = UIColor(white: 1.0, alpha: 0.1).CGColor as CGColorRef
        let color3 = UIColor.clearColor().CGColor as CGColorRef
        let color4 = UIColor(white: 0.0, alpha: 0.05).CGColor as CGColorRef
        
        gradientLayer.colors = [color1,color2,color3,color4]
        gradientLayer.locations = [0.0,0.2,0.95,1.0]
        
        layer.insertSublayer(gradientLayer,atIndex: 0)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = self.bounds
    }
    


}
