//
//  ViewController.swift
//  Project18-CharaterLimit
//
//  Created by LeeWong on 16/3/1.
//  Copyright © 2016年 LeeWong. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextViewDelegate {

    @IBOutlet weak var iconImage: UIImageView!
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var bottomToolView: UIView!
    
    @IBOutlet weak var characterNumLabel: UILabel!
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        textView.delegate = self
        iconImage.layer.cornerRadius = iconImage.frame.size.width/2.0
        textView.backgroundColor = UIColor.clearColor()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyBoardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyBoardWillHide:" , name: UIKeyboardWillHideNotification, object: nil)
        
    }
    
    
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        
        let myTextViewString = textView.text
        characterNumLabel.text = "\(140-myTextViewString.characters.count)"
        
        if range.length > 140 {
            return false
        }
        
        //删除键
        if text.characters.count == 0 && range.length == 1 {
            return true
        }
        
        let newLength = (myTextViewString?.characters.count)! + range.length
        
        return newLength < 140
        
    }
    
    
    func keyBoardWillShow(note:NSNotification) {
        
        let userInfo = note.userInfo
        let keyBoardBounds = (userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
   
        let duration = (userInfo![UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        
        let deltaY = keyBoardBounds.size.height
        
        let animations:(() ->Void) = {
            self.bottomToolView.transform = CGAffineTransformMakeTranslation(0, -deltaY)

        }
        
        if duration > 0 {
            let options = UIViewAnimationOptions(rawValue: UInt((userInfo![UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).integerValue << 16))
        
            UIView.animateWithDuration(duration, delay: 0.0, options: options, animations: animations, completion: nil)
        } else {
            animations()
        }
        
    
    }
    
    
    
    func keyBoardWillHide(note:NSNotification) {
        let userInfo  = note.userInfo
        let duration = (userInfo![UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        
        let animations:(() -> Void) = {
            
            self.bottomToolView.transform = CGAffineTransformIdentity
            
        }
        
        if duration > 0 {
            let options = UIViewAnimationOptions(rawValue: UInt((userInfo![UIKeyboardAnimationCurveUserInfoKey] as! NSNumber).integerValue << 16))
            
            UIView.animateWithDuration(duration, delay: 0, options:options, animations: animations, completion: nil)
            
        }else{
            
            animations()
        }
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

