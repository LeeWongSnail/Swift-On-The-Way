//
//  ViewController.swift
//  Project04-SnapChatMenu
//
//  Created by LeeWong on 16/2/22.
//  Copyright © 2016年 LeeWong. All rights reserved.
//

import UIKit

struct ScreenSize {
    var width = UIScreen.mainScreen().bounds.size.width
    var height = UIScreen.mainScreen().bounds.size.height
}

class ViewController: UIViewController {
  
    @IBOutlet weak var scrollView: UIScrollView!
    
    let screenSize = ScreenSize()
    
    func combineView() {
        
        let leftVC = LeftViewController(nibName: "LeftViewController", bundle: nil)
        self.addChildViewController(leftVC)
        self.scrollView.addSubview(leftVC.view)
        leftVC.didMoveToParentViewController(self)

        
        let rightVC = RightViewController(nibName: "RightViewController", bundle: nil)
        self.addChildViewController(rightVC)
        self.scrollView.addSubview(rightVC.view)
        rightVC.didMoveToParentViewController(self)
        
        var rightFrame = rightVC.view.frame
        rightFrame.origin.x = screenSize.width * 2
        rightVC.view.frame = rightFrame
        
        let midVC = MidViewController(nibName: "MidViewController", bundle: nil)
        self.addChildViewController(midVC)
        self.scrollView.addSubview(midVC.view)
        midVC.didMoveToParentViewController(self)
        var midFrame = midVC.view.frame
        midFrame.origin.x = screenSize.width
        midVC.view.frame = midFrame
 
       scrollView.contentSize = CGSizeMake(screenSize.width * 3, screenSize.height);

    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        scrollView.pagingEnabled = true
        combineView()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

