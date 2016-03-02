//
//  AnimationImageCollection.swift
//  Project20-CollectionViewAnimation
//
//  Created by LeeWong on 16/3/1.
//  Copyright © 2016年 LeeWong. All rights reserved.
//

import UIKit


struct AnimationImageCollection {
    
    private let imagePath = ["1","2","3","4","5"]
    
    var images: [AnimationCellModel]
    
    init() {
        images = imagePath.map{
            AnimationCellModel(imagePath: $0)
        }
    }
}