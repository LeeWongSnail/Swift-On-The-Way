//
//  Interest.swift
//  Project05 - Carousel Effect
//
//  Created by LeeWong on 16/2/23.
//  Copyright © 2016年 LeeWong. All rights reserved.
//

import UIKit

class Interest: NSObject {
    // MARK: - Public API
    var title = ""
    var desc = ""
    var numberOfMembers = 0
    var numberOfPosts = 0
    var featuredImage: UIImage!
    
    init(title: String, desc: String, featuredImage: UIImage!)
    {
        self.title = title
        self.desc = desc
        self.featuredImage = featuredImage
        numberOfMembers = 1
        numberOfPosts = 1
    }
    
    // MARK: - Private
    // dummy data
    static func createInterests() -> [Interest]
    {
        return [
            Interest(title: "Hello there, i miss u.", desc: "We love backpack and adventures! We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "hello")!),
            Interest(title: "🐳🐳🐳🐳🐳", desc: "We love romantic stories. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "dudu")!),
            Interest(title: "Training like this, #bodyline", desc: "Create beautiful apps. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "bodyline")!),
            Interest(title: "I'm hungry, indeed.", desc: "Cars and aircrafts and boats and sky. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "wave")!),
            Interest(title: "Dark Varder, #emoji", desc: "Meet life with full presence. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "darkvarder")!),
            Interest(title: "I have no idea, bitch", desc: "Get up to date with breaking-news. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "hhhhh")!),
        ]
    }

}
