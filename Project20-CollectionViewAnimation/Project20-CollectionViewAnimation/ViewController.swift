//
//  ViewController.swift
//  Project20-CollectionViewAnimation
//
//  Created by LeeWong on 16/3/1.
//  Copyright © 2016年 LeeWong. All rights reserved.
//

import UIKit

extension Array {
    func safeIndex(i:Int) -> Element? {
        return i < self.count && i >= 0 ? self[i] : nil
    }
}


class ViewController: UICollectionViewController {

    private struct Storyboard {
        static let cellIdentifier = String(CollectionCell)
        static let nidName = String(CollectionCell)
    }
    
    private struct Constants {
        static let animationDuration : Double = 0.5
        static let animationDelay: Double = 0.0
        static let animationSpringDamping: CGFloat = 1.0
        static let animationInitialSpringVelocity: CGFloat = 1.0
        
    }
    
    var imageCollection : AnimationImageCollection?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imageCollection = AnimationImageCollection()
        
        
        collectionView?.registerNib(UINib(nibName: Storyboard.nidName, bundle: NSBundle .mainBundle()), forCellWithReuseIdentifier: Storyboard.cellIdentifier)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView?.reloadData()
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageCollection?.images.count ?? 0
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
      guard  let cell = collectionView.dequeueReusableCellWithReuseIdentifier(Storyboard.cellIdentifier, forIndexPath: indexPath) as? CollectionCell,
        
        viewModel = imageCollection?.images.safeIndex(indexPath.row) else {
            return UICollectionViewCell()
        }
        
        cell.prepareCell(viewModel)
        return cell
    }
    
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        guard let cell = collectionView.cellForItemAtIndexPath(indexPath) as? CollectionCell
            else {
                return
        }
        
        self.handleAnimationCellSelected(collectionView, cell: cell)
    }
    
    
    private func handleAnimationCellSelected(collectionView:UICollectionView,cell:CollectionCell) {
        
        cell.handleCellSelected()
        cell.backButtonTapped = self.backButtonDidTouch
        
        let animation: ()-> () = {
            cell.frame = collectionView.bounds
        }
        
        
        let completion: (finished: Bool) -> () = { _ in
            collectionView.scrollEnabled = false
        }
        
        UIView.animateWithDuration(Constants.animationDuration, delay: Constants.animationDelay, usingSpringWithDamping: Constants.animationSpringDamping, initialSpringVelocity: Constants.animationInitialSpringVelocity, options: [], animations: animation, completion: completion)
        
    }
    
    
    func backButtonDidTouch() {
        guard let indexPaths = self.collectionView?.indexPathsForSelectedItems() else {
            return
        }
        
        collectionView?.scrollEnabled = true
        collectionView?.reloadItemsAtIndexPaths(indexPaths)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

