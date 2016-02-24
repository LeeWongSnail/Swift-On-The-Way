//
//  ViewController.swift
//  Project 8 - Random Color Gradient
//
//  Created by LeeWong on 16/2/24.
//  Copyright © 2016年 LeeWong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var gradientLayer = CAGradientLayer()
    var timer = NSTimer()
    
    private func addGradientLayer() {
        
        //init layer
        gradientLayer.frame = self.view.bounds
        self.view.layer.addSublayer(gradientLayer)
        
        //setting direction
        gradientLayer.startPoint = CGPointZero
        gradientLayer.endPoint = CGPointMake(1, 1)
        
        //设置颜色组
        gradientLayer.colors = [UIColor.clearColor().CGColor,UIColor.greenColor().CGColor,UIColor.yellowColor().CGColor,UIColor.cyanColor(),UIColor.purpleColor(), UIColor.redColor().CGColor]
        
        //设置颜色分割点
        gradientLayer.locations = [0.1,0.3,0.5,0.7,0.9,1.0]
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.5, target: self, selector: "colorChange", userInfo: nil, repeats: true)
        
    }
    
    @objc func colorChange() {
        
        var colors = [CGColor]()
        var locs = [Double]()
        for _ in 1...6 {
            let r = CGFloat(drand48())
            let g = CGFloat(drand48())
            let b = CGFloat(drand48())
            colors.append(UIColor(red:r, green: g, blue: b, alpha: 1.0).CGColor)
            
            locs.append(Double(random()%10) / 10.0)
        }
        
        
        gradientLayer.colors = colors
        
        gradientLayer.locations = locs
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addGradientLayer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

