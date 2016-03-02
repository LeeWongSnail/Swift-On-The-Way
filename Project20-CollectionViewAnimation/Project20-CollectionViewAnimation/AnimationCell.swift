//
//  AnimationCell.swift
//  Project20-CollectionViewAnimation
//
//  Created by LeeWong on 16/3/1.
//  Copyright © 2016年 LeeWong. All rights reserved.
//

import UIKit

class AnimationCell: UICollectionViewCell {
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var iconImageV: UIImageView!
    
    @IBOutlet weak var textView: UITextView!
    
    var backButtonTapped: (() ->Void)?
    
    func prepareCell(viewModel:AnimationCellModel) {
        iconImageV.image = UIImage(named: viewModel.imagePath)
        textView.scrollEnabled = false
        backBtn.hidden = true
        
//        addTapEventHandler()
    }
    
    @IBAction func btnClick() {
        print("8888888888")
    }
    
    func handleCellSelected() {
        textView.scrollEnabled = false
        backBtn.hidden = false
        self.superview?.bringSubviewToFront(self)
    }
    
    
    private func addTapEventHandler() {
        backBtn.addTarget(self, action: Selector("backButtonDidTouch:"),
            forControlEvents: .TouchUpInside)
    }
    
    func backButtonDidTouch(sender:UIGestureRecognizer) {
        backButtonTapped?()
    }
    
}
