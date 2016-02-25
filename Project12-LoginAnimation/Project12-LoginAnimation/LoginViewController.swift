//
//  LoginViewController.swift
//  Project12-LoginAnimation
//
//  Created by LeeWong on 16/2/25.
//  Copyright © 2016年 LeeWong. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var usernameCenterConstrain: NSLayoutConstraint!
    
    @IBOutlet weak var passwordCenterConstrain: NSLayoutConstraint!
    
    @IBOutlet weak var loginBtnWidthConstrain: NSLayoutConstraint!
    
    
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBAction func loginDidClick() {
        UIView.animateWithDuration(1.5, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
            self.loginBtn.bounds = CGRect(x: self.loginBtn.bounds.origin.x - 20, y: self.loginBtn.bounds.origin.y, width: self.loginBtn.bounds.size.width + 60, height: self.loginBtn.bounds.size.height)
            self.loginBtn.enabled = false
        }, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        usernameCenterConstrain.constant -= self.view.bounds.size.width
        passwordCenterConstrain.constant -= self.view.bounds.size.width
        loginBtn.alpha = 0.0
    }


    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(0.5, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.usernameCenterConstrain.constant += self.view.bounds.size.width
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.2, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.passwordCenterConstrain.constant += self.view.bounds.size.width
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.5, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.loginBtn.alpha = 1.0
            }, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
