//
//  MenuTransitionManager.swift
//  Project17-TumblrMenu
//
//  Created by LeeWong on 16/2/29.
//  Copyright © 2016年 LeeWong. All rights reserved.
//

import UIKit

class MenuTransitionManager: NSObject,UIViewControllerAnimatedTransitioning,UIViewControllerTransitioningDelegate {

    private var presenting = false
    private var duration = 0.5
    
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        let container = transitionContext.containerView()
        
        let screens : (from:UIViewController,to:UIViewController) =
            (transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!,
            transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        )
        
        let menuViewController = !self.presenting ? screens.from as! MenuViewController : screens.to as! MenuViewController
        let bottomViewController = !self.presenting ? screens.to as UIViewController : screens.from as UIViewController
        
        let menuView = menuViewController.view
        let bottomView = bottomViewController.view
        
        if (self.presenting) {
            self.offStageMenuController(menuViewController)
        }
        
        container?.addSubview(bottomView)
        container?.addSubview(menuView)
        
        
        let duration = self.transitionDuration(transitionContext)
        
        
        UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.8, options: [], animations: { () -> Void in
            if(self.presenting) {
                self.onStageMenuController(menuViewController)
            }else {
                self.offStageMenuController(menuViewController)
            }
            }) { finish in
                transitionContext.completeTransition(true)
                UIApplication.sharedApplication().keyWindow!.addSubview(screens.to.view)
        }
        
    }
    
    func offstage(amount: CGFloat) ->CGAffineTransform {
        return CGAffineTransformMakeTranslation(amount, 0)
    }
    
    func offStageMenuController(menuViewController:MenuViewController) {
        
        menuViewController.view.alpha = 0
        
        let topRowOffset : CGFloat = 300
        let middleRowOffset : CGFloat = 150
        let bottomRowOffset : CGFloat = 50
        
        
        menuViewController.textBtn.transform = self.offstage(bottomRowOffset)
        menuViewController.textLabel.transform = self.offstage(bottomRowOffset)
        
        menuViewController.quotoBtn.transform = self.offstage(-bottomRowOffset)
        menuViewController.quotoLabel.transform = self.offstage(-bottomRowOffset)
        
        menuViewController.chatLabel.transform = self.offstage(topRowOffset)
        menuViewController.chatBtn.transform = self.offstage(topRowOffset)
        
        menuViewController.photoBtn.transform = self.offstage(middleRowOffset)
        menuViewController.photoLabel.transform = self.offstage(middleRowOffset)
        
        menuViewController.linkBtn.transform = self.offstage(-middleRowOffset)
        menuViewController.linkLabel.transform = self.offstage(-middleRowOffset)
        
        menuViewController.audioBtn.transform = self.offstage(-topRowOffset)
        menuViewController.audioLabel.transform = self.offstage(-topRowOffset)
    }
    
    func onStageMenuController(menuViewController:MenuViewController) {
        menuViewController.view.alpha = 1
        
        menuViewController.textBtn.transform = CGAffineTransformIdentity
        menuViewController.textLabel.transform = CGAffineTransformIdentity
        
        menuViewController.quotoBtn.transform = CGAffineTransformIdentity
        menuViewController.quotoLabel.transform = CGAffineTransformIdentity
        
        menuViewController.chatLabel.transform = CGAffineTransformIdentity
        menuViewController.chatBtn.transform = CGAffineTransformIdentity
        
        menuViewController.photoBtn.transform = CGAffineTransformIdentity
        menuViewController.photoLabel.transform = CGAffineTransformIdentity
        
        menuViewController.linkBtn.transform = CGAffineTransformIdentity
        menuViewController.linkLabel.transform = CGAffineTransformIdentity
        
        menuViewController.audioBtn.transform = CGAffineTransformIdentity
        menuViewController.audioLabel.transform = CGAffineTransformIdentity
    }
    
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return duration
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        self.presenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = false
        return self
    }
    
}
