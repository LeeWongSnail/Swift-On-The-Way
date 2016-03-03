//
//  ThirdViewController.swift
//  Project23-TabbarAnimation
//
//  Created by LeeWong on 16/3/3.
//  Copyright © 2016年 LeeWong. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var bgImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationController?.navigationBarHidden = true
        self.bgImageView.alpha = 0
        self.bgImageView.transform = CGAffineTransformMakeScale(0.5, 0.5)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
        UIView.animateWithDuration(0.5, delay: 0.1, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .CurveEaseIn, animations: { () -> Void in
            
            self.bgImageView.transform = CGAffineTransformMakeScale(1, 1)
            self.bgImageView.alpha = 1
            
            }, completion: nil )
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
