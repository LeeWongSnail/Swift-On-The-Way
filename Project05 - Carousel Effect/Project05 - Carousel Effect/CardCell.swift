//
//  CardCell.swift
//  Project05 - Carousel Effect
//
//  Created by LeeWong on 16/2/23.
//  Copyright © 2016年 LeeWong. All rights reserved.
//

import UIKit

class CardCell: UICollectionViewCell {
    
    @IBOutlet weak var cardImageView: UIImageView!
    
    @IBOutlet weak var descLabel: UILabel!
    
    
    var interst : Interest! {
        didSet {
            updateUI()
        }
    }
    
    private func updateUI() {
        cardImageView?.image! = interst.featuredImage
        descLabel?.text! = interst.desc
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
    }
    
}
