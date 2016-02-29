//
//  MenuViewController.swift
//  Project17-TumblrMenu
//
//  Created by LeeWong on 16/2/29.
//  Copyright © 2016年 LeeWong. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    let transitionManager = MenuTransitionManager()

    @IBOutlet weak var audioBtn: UIButton!
    
    @IBOutlet weak var audioLabel: UILabel!
    @IBOutlet weak var chatBtn: UIButton!
    
    @IBOutlet weak var chatLabel: UILabel!
    @IBOutlet weak var textBtn: UIButton!
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var photoBtn: UIButton!
    
    @IBOutlet weak var photoLabel: UILabel!
    @IBOutlet weak var quotoBtn: UIButton!
    
    @IBOutlet weak var quotoLabel: UILabel!
    @IBOutlet weak var linkBtn: UIButton!
    @IBOutlet weak var linkLabel: UILabel!
    
    @IBAction func neverMind(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.transitioningDelegate = self.transitionManager

        // Do any additional setup after loading the view.
    }
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        
        return UIStatusBarStyle.LightContent
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
