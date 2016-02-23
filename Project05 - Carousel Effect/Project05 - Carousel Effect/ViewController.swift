//
//  ViewController.swift
//  Project05 - Carousel Effect
//
//  Created by LeeWong on 16/2/23.
//  Copyright © 2016年 LeeWong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bgImage: UIImageView!
    
    @IBOutlet weak var collectionVIew: UICollectionView!
    
    private var reuserID = "cardCell"
    
    var interests = [Interest]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         interests = Interest.createInterests()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController : UICollectionViewDataSource {

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interests.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuserID, forIndexPath: indexPath) as! CardCell
        
        cell.interst = interests[indexPath.row]
        
        return cell

    }
}
