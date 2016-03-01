//
//  ViewController.swift
//  Project19-PullToRefresh
//
//  Created by LeeWong on 16/3/1.
//  Copyright © 2016年 LeeWong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var refreshController: UIRefreshControl!
    var customView : UIView!
    var labelsArray : Array<UILabel> = []
    var isAnimating = false
    var currentColorIndex = 0
    var currentLabelIndex = 0
    var timer : NSTimer!
    var dataArray: Array<String> = ["😂", "🤗", "😳", "😌", "😊"]

    
    //load View
    func loadRefreshView() {
        let refreshView = NSBundle.mainBundle().loadNibNamed("Refresh", owner: self, options: nil)
        
        customView = refreshView[0] as! UIView
        
        customView.frame = refreshController.bounds
        
        for var i=0; i < customView.subviews.count; ++i {
            
            labelsArray.append(customView.viewWithTag(i + 1) as! UILabel)
            
        }
        
        refreshController.addSubview(customView)
    }
    
    
    func getNextColor() ->UIColor{
        var colorsArray: Array<UIColor> = [UIColor.magentaColor(), UIColor.brownColor(), UIColor.yellowColor(), UIColor.redColor(), UIColor.greenColor(), UIColor.blueColor(), UIColor.orangeColor()]
        
        if currentColorIndex == colorsArray.count {
            currentColorIndex = 0
        }
        
        let returnColor = colorsArray[currentColorIndex]
        ++currentColorIndex
        
        return returnColor
    }
    
    // Mark: 动画
    func animateRefreshStep1() {
        isAnimating = true
        
        UIView.animateWithDuration(0.1, delay: 0.0, options: .CurveLinear, animations: { () -> Void in
            
            self.labelsArray[self.currentLabelIndex].transform = CGAffineTransformMakeRotation(CGFloat(M_PI_4))
            self.labelsArray[self.currentColorIndex].textColor = self.getNextColor()
            
            }) { (finish) -> Void in
                
                UIView.animateWithDuration(0.05, delay: 0.0, options: .CurveLinear, animations: { () -> Void in
                    
                    self.labelsArray[self.currentLabelIndex].transform = CGAffineTransformIdentity
                    self.labelsArray[self.currentLabelIndex].textColor = UIColor.blackColor()
                    
                    
                    }, completion: { (finish) -> Void in
                    
                        ++self.currentLabelIndex
                        if self.currentLabelIndex < self.labelsArray.count {
                            self.animateRefreshStep1()
                        } else {
                            self.animateRefreshStep2()
                        }
                })
        }
        
        
    }
    
    
    func animateRefreshStep2() {
        UIView.animateWithDuration(0.40, delay: 0.0, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
            
            self.labelsArray[0].transform = CGAffineTransformMakeScale(1.5, 1.5)
            self.labelsArray[1].transform = CGAffineTransformMakeScale(1.5, 1.5)
            self.labelsArray[2].transform = CGAffineTransformMakeScale(1.5, 1.5)
            self.labelsArray[3].transform = CGAffineTransformMakeScale(1.5, 1.5)
            self.labelsArray[4].transform = CGAffineTransformMakeScale(1.5, 1.5)
            self.labelsArray[5].transform = CGAffineTransformMakeScale(1.5, 1.5)
            self.labelsArray[6].transform = CGAffineTransformMakeScale(1.5, 1.5)
            self.labelsArray[7].transform = CGAffineTransformMakeScale(1.5, 1.5)
            self.labelsArray[8].transform = CGAffineTransformMakeScale(1.5, 1.5)
            self.labelsArray[9].transform = CGAffineTransformMakeScale(1.5, 1.5)
            
            }, completion: { (finished) -> Void in
                
                UIView.animateWithDuration(0.25, delay: 0.0, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
                    self.labelsArray[0].transform = CGAffineTransformIdentity
                    self.labelsArray[1].transform = CGAffineTransformIdentity
                    self.labelsArray[2].transform = CGAffineTransformIdentity
                    self.labelsArray[3].transform = CGAffineTransformIdentity
                    self.labelsArray[4].transform = CGAffineTransformIdentity
                    self.labelsArray[5].transform = CGAffineTransformIdentity
                    self.labelsArray[6].transform = CGAffineTransformIdentity
                    self.labelsArray[7].transform = CGAffineTransformIdentity
                    self.labelsArray[8].transform = CGAffineTransformIdentity
                    self.labelsArray[9].transform = CGAffineTransformIdentity
                    
                    }, completion: { (finished) -> Void in
                        if self.refreshController.refreshing {
                            self.currentLabelIndex = 0
                            self.animateRefreshStep1()
                        }
                        else {
                            self.isAnimating = false
                            self.currentLabelIndex = 0
                            for var i=0; i<self.labelsArray.count; ++i {
                                self.labelsArray[i].textColor = UIColor.blackColor()
                                self.labelsArray[i].transform = CGAffineTransformIdentity
                            }
                        }
                })
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 60
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "tableviewcell")
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
    
        refreshController = UIRefreshControl()
        refreshController.backgroundColor = UIColor.clearColor()
        refreshController.tintColor = UIColor.clearColor()
       
        tableView.addSubview(refreshController)
        
        loadRefreshView()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



extension ViewController:UITableViewDataSource,UITableViewDelegate {
    
     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCellWithIdentifier("tableviewcell")!
        
        cell.textLabel?.text = dataArray[indexPath.row]
        cell.textLabel?.textAlignment = NSTextAlignment.Center
        cell.contentView.backgroundColor = UIColor.blueColor()
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        if refreshController.refreshing {
            if !isAnimating {
                
                doSomething()
                animateRefreshStep1()
                
            }
        }
    }
    
    func doSomething() {
        
        timer = NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: "endedOfWork", userInfo: nil, repeats: true)
    }
    
    func endedOfWork() {
        
        refreshController.endRefreshing()
        timer.invalidate()
        timer = nil
    }
    
}