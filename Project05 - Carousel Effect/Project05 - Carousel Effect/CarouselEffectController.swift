//
//  CarouselEffectController.swift
//  Project05 - Carousel Effect
//
//  Created by LeeWong on 16/2/23.
//  Copyright © 2016年 LeeWong. All rights reserved.
//

import UIKit

struct ScreenSize {
    static let width = UIScreen.mainScreen().bounds.size.width
    static let height = UIScreen.mainScreen().bounds.size.height
}

private let reuseIdentifier = "CardCell"

class CarouselEffectController: UICollectionViewController,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    var interests = [Interest]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interests = Interest.createInterests()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return interests.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CardCell
    
        let interst = interests[indexPath.row]
        
        cell.cardImageView.image = interst.featuredImage
        cell.descLabel.text = interst.desc
    
        return cell
    }
    
}
